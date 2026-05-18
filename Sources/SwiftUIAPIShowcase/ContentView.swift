import SwiftUI

struct ContentView: View {
    @State private var selection: APIEntry.ID? = APICatalog.entries.first?.id
    @State private var selectedCategory: APICategory? = nil
    @State private var searchText = ""

    private var filteredEntries: [APIEntry] {
        APICatalog.entries
            .filter { selectedCategory == nil || $0.category == selectedCategory }
            .filter {
                searchText.isEmpty ||
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.summary.localizedCaseInsensitiveContains(searchText) ||
                $0.category.rawValue.localizedCaseInsensitiveContains(searchText)
            }
            .sorted { $0.name.localizedStandardCompare($1.name) == .orderedAscending }
    }

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                Section("Categories") {
                    CategoryRow(title: "All APIs", systemImage: "square.grid.2x2", isSelected: selectedCategory == nil) {
                        selectedCategory = nil
                    }

                    ForEach(APICategory.allCases) { category in
                        CategoryRow(title: category.rawValue, systemImage: category.symbolName, isSelected: selectedCategory == category) {
                            selectedCategory = category
                        }
                    }
                }

                Section("\(filteredEntries.count) Entries") {
                    ForEach(filteredEntries) { entry in
                        NavigationLink(value: entry.id) {
                            APIEntryRow(entry: entry)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI APIs")
            .searchable(text: $searchText, prompt: "Search APIs")
        } detail: {
            if let selected = selectedEntry {
                APIDetailView(entry: selected)
                    .id(selected.id)
            } else {
                ContentUnavailableView("Select an API", systemImage: "swift", description: Text("Choose an item from the list."))
            }
        }
        .onChange(of: filteredEntries) { _, entries in
            if let selection, entries.contains(where: { $0.id == selection }) {
                return
            }
            selection = entries.first?.id
        }
    }

    private var selectedEntry: APIEntry? {
        guard let selection else { return filteredEntries.first }
        return APICatalog.entries.first { $0.id == selection } ?? filteredEntries.first
    }
}

struct CategoryRow: View {
    let title: String
    let systemImage: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(.plain)
        .foregroundStyle(isSelected ? .tint : .primary)
    }
}

struct APIEntryRow: View {
    let entry: APIEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(entry.name)
                    .font(.headline)
                if entry.demo != nil {
                    Image(systemName: "play.circle.fill")
                        .foregroundStyle(.green)
                        .imageScale(.small)
                        .accessibilityLabel("Live demo")
                }
            }

            Text(entry.category.rawValue)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 3)
    }
}

