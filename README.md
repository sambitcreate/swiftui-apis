# SwiftUI API Showcase

This repository contains:

- `swiftUI-apis.md`: a researched SwiftUI API catalog based on Apple Developer Documentation.
- `Sources/SwiftUIAPIShowcase`: a SwiftUI app that lets you browse the catalog one API at a time.
- Live demos for portable, renderable APIs and reference cards for protocols, style contracts, generated configuration types, platform-specific APIs, and APIs that require external setup.

## Running

Open this folder in Xcode 15 or newer on macOS:

1. Choose **File > Open** and select the repository folder.
2. Select the `SwiftUIAPIShowcase` executable scheme.
3. Run with the **My Mac** destination.

This container does not include `swift` or `xcodebuild`, so local compilation could not be performed here.

## Coverage Model

The app is intentionally data-driven. `APICatalog.swift` lists every showcased API entry and maps live entries to a `DemoKind`. `APIDetailView.swift` routes those demo kinds to concrete SwiftUI demos. Reference entries remain visible and searchable so the showcase covers APIs that are not safely portable as simple inline views.

## Research Sources

Primary source: Apple Developer Documentation DocC JSON for SwiftUI, especially the SwiftUI framework overview, `View` protocol, category collection pages, and SwiftUI updates pages.
