#!/usr/bin/env python3
import json
import re
import sys
import time
import urllib.error
import urllib.request
from collections import deque
from pathlib import Path

ROOT = "https://developer.apple.com/tutorials/data"
DOC_PREFIX = "doc://com.apple.SwiftUI/documentation/SwiftUI"
CACHE = Path(".api-cache")
RESOURCE = Path("Sources/SwiftUIAPIShowcase/Resources/swiftui-api-index.json")
MARKDOWN = Path("swiftUI-apis.md")

SEEDS = [
    "/documentation/swiftui",
    "/documentation/swiftui/view",
]


def slug_for_path(path):
    return path.strip("/").replace("/", "_").replace(":", "_").replace("*", "_") + ".json"


def json_path_for_doc_path(path):
    return path.strip("/") + ".json"


def fetch(path):
    CACHE.mkdir(exist_ok=True)
    cache_file = CACHE / slug_for_path(path)
    if cache_file.exists():
        return json.loads(cache_file.read_text())

    url = f"{ROOT}/{json_path_for_doc_path(path)}"
    request = urllib.request.Request(url, headers={"User-Agent": "SwiftUIAPIShowcase/1.0"})
    try:
        with urllib.request.urlopen(request, timeout=30) as response:
            data = response.read().decode("utf-8")
    except urllib.error.HTTPError as error:
        if error.code == 404:
            return None
        raise

    cache_file.write_text(data)
    time.sleep(0.05)
    return json.loads(data)


def flatten_text(value):
    if not value:
        return ""
    parts = []
    for item in value:
        if "text" in item:
            parts.append(item["text"])
        elif "code" in item:
            parts.append(item["code"])
    return " ".join(parts).strip()


def title_from_reference(identifier, ref):
    title = ref.get("title") or ref.get("navigatorTitle") or identifier.rsplit("/", 1)[-1]
    if isinstance(title, list):
        return flatten_text(title)
    return str(title)


def declaration_from_reference(ref):
    fragments = ref.get("fragments") or []
    if fragments:
        return "".join(fragment.get("text", "") for fragment in fragments).strip()
    return ""


def category_for(path, title):
    haystack = f"{path} {title}".lower()
    pairs = [
        ("accessibility", "Accessibility"),
        ("navigation", "Navigation"),
        ("presentation", "Presentation"),
        ("toolbar", "Toolbars"),
        ("search", "Search"),
        ("gesture", "Gestures"),
        ("animation", "Animations"),
        ("layout", "Layout"),
        ("scroll", "Scroll views"),
        ("list", "Lists"),
        ("table", "Tables"),
        ("shape", "Shapes"),
        ("drawing", "Drawing and graphics"),
        ("graphic", "Drawing and graphics"),
        ("control", "Controls and indicators"),
        ("picker", "Controls and indicators"),
        ("button", "Controls and indicators"),
        ("text", "Text input and output"),
        ("image", "Images"),
        ("environment", "Environment values"),
        ("preference", "Preferences"),
        ("storage", "Persistent storage"),
        ("scene", "App structure"),
        ("window", "App structure"),
        ("app", "App structure"),
        ("uikit", "Framework integration"),
        ("appkit", "Framework integration"),
        ("watchkit", "Framework integration"),
        ("visionos", "Platform specific"),
        ("reality", "Platform specific"),
        ("map", "Framework integration"),
        ("storekit", "Framework integration"),
    ]
    for needle, category in pairs:
        if needle in haystack:
            return category
    return "SwiftUI"


def collect():
    queue = deque(SEEDS)
    seen_paths = set()
    symbols = {}
    topic_pages = {}

    while queue:
        path = queue.popleft()
        if path in seen_paths or not path.startswith("/documentation/swiftui"):
            continue
        seen_paths.add(path)
        document = fetch(path)
        if not document:
            continue

        metadata = document.get("metadata", {})
        current_title = metadata.get("title") or path.rsplit("/", 1)[-1]
        if metadata.get("role") in {"collection", "article", "collectionGroup"}:
            topic_pages[path] = current_title

        for section_name in ("topicSections", "seeAlsoSections", "relationshipsSections"):
            for section in document.get(section_name, []):
                for identifier in section.get("identifiers", []):
                    if identifier.startswith(DOC_PREFIX):
                        ref = document.get("references", {}).get(identifier, {})
                        ref_path = ref.get("url")
                        ref_role = ref.get("role", "")
                        ref_kind = ref.get("kind", "")
                        declaration = declaration_from_reference(ref)
                        is_symbol = ref_role == "symbol" or ref_kind == "symbol" or bool(declaration)
                        if ref_path and ref_path.startswith("/documentation/swiftui") and not is_symbol:
                            queue.append(ref_path)

        for ref_identifier, ref in document.get("references", {}).items():
            if not ref_identifier.startswith(DOC_PREFIX):
                continue
            ref_path = ref.get("url", "")
            title = title_from_reference(ref_identifier, ref)
            role = ref.get("role", "")
            kind = ref.get("kind", "")
            symbol_kind = ref.get("symbolKind", "")
            declaration = declaration_from_reference(ref)
            abstract = flatten_text(ref.get("abstract"))

            if ref_path.startswith("/documentation/swiftui"):
                if role in {"collectionGroup", "article", "collection", "sampleCode"} or kind == "article":
                    queue.append(ref_path)
                if role == "symbol" or kind == "symbol" or declaration:
                    key = ref_identifier
                    symbols[key] = {
                        "id": key,
                        "name": title,
                        "path": ref_path,
                        "role": role or kind or "symbol",
                        "kind": symbol_kind or kind or role or "symbol",
                        "declaration": declaration,
                        "abstract": abstract,
                        "category": category_for(ref_path, title),
                        "referenceOnly": True,
                    }

    return sorted(symbols.values(), key=lambda item: (item["category"], item["name"], item["path"])), topic_pages


def markdown_for(symbols, topic_pages):
    by_category = {}
    for symbol in symbols:
        by_category.setdefault(symbol["category"], []).append(symbol)

    lines = [
        "# SwiftUI APIs Catalog",
        "",
        "Generated from Apple Developer Documentation DocC JSON for SwiftUI.",
        "",
        f"- Generated entries: {len(symbols)}",
        f"- Traversed topic pages: {len(topic_pages)}",
        "- Live showcase demos are implemented in the SwiftUI app for portable visual APIs.",
        "- Reference-only entries remain searchable in the app when an API is a protocol, modifier, style contract, generated configuration type, platform-specific API, or requires external framework setup.",
        "",
        "## Source Seeds",
        "",
    ]
    for seed in SEEDS:
        lines.append(f"- `https://developer.apple.com{seed}`")

    lines += [
        "",
        "## Categories",
        "",
        "| Category | API count |",
        "| --- | ---: |",
    ]
    for category in sorted(by_category):
        lines.append(f"| {category} | {len(by_category[category])} |")

    for category in sorted(by_category):
        lines += ["", f"## {category}", ""]
        for symbol in by_category[category]:
            declaration = f" `{symbol['declaration']}`" if symbol["declaration"] else ""
            abstract = f" - {symbol['abstract']}" if symbol["abstract"] else ""
            url = f"https://developer.apple.com{symbol['path']}" if symbol["path"] else ""
            link = f" ([docs]({url}))" if url else ""
            lines.append(f"- **{symbol['name']}**{declaration}{abstract}{link}")

    lines += [
        "",
        "## Showcase Strategy",
        "",
        "The app demonstrates common, portable, renderable SwiftUI APIs directly. The generated full index is bundled as `swiftui-api-index.json` and merged into the app catalog as reference entries, so APIs that cannot be instantiated in a generic cross-platform demo still appear one by one in the browser.",
        "",
    ]
    return "\n".join(lines)


def main():
    symbols, topic_pages = collect()
    if len(symbols) < 500:
        print(f"Refusing to write suspiciously small index: {len(symbols)} symbols", file=sys.stderr)
        return 1

    RESOURCE.parent.mkdir(parents=True, exist_ok=True)
    RESOURCE.write_text(json.dumps(symbols, indent=2, sort_keys=True) + "\n")
    MARKDOWN.write_text(markdown_for(symbols, topic_pages) + "\n")
    print(f"Wrote {len(symbols)} SwiftUI API entries")
    print(f"Wrote {RESOURCE}")
    print(f"Wrote {MARKDOWN}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
