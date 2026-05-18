import SwiftUI

struct StackLayoutDemo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("HStack")
                Spacer()
                Text("Spacer")
            }
            Divider()
            ZStack {
                RoundedRectangle(cornerRadius: 8).fill(.blue.opacity(0.2))
                Circle().fill(.orange.opacity(0.8)).frame(width: 72, height: 72)
                Text("ZStack").bold()
            }
            .frame(height: 140)
        }
    }
}

struct GridLayoutDemo: View {
    private let columns = [GridItem(.adaptive(minimum: 72), spacing: 12)]
    private let colors: [Color] = [.red, .orange, .yellow, .green, .teal, .blue, .purple, .pink]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                GridRow {
                    Text("Grid").bold()
                    Text("Row").bold()
                    Text("Cells").bold()
                }
                GridRow {
                    Text("A")
                    Text("B")
                    Text("C")
                }
            }

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(colors.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(colors[index].gradient)
                        .frame(height: 56)
                        .overlay(Text("\(index + 1)").bold().foregroundStyle(.white))
                }
            }
        }
    }
}

struct ScrollAPIDemo: View {
    @State private var target = 1

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Stepper("Scroll target: \(target)", value: $target, in: 1...30)
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(1...30, id: \.self) { value in
                            Text("Row \(value)")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(value == target ? .blue.opacity(0.2) : .gray.opacity(0.12), in: RoundedRectangle(cornerRadius: 8))
                                .id(value)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .frame(height: 260)
                .scrollIndicators(.visible)
                .onChange(of: target) { _, value in
                    withAnimation {
                        proxy.scrollTo(value, anchor: .center)
                    }
                }
            }
        }
    }
}

struct NavigationAPIDemo: View {
    @State private var path: [String] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink("NavigationLink destination", value: "Detail")
                Button("Push programmatically") {
                    path.append("Programmatic detail")
                }
                TabView {
                    Label("First", systemImage: "1.circle")
                        .tabItem { Label("One", systemImage: "1.circle") }
                    Label("Second", systemImage: "2.circle")
                        .tabItem { Label("Two", systemImage: "2.circle") }
                }
                .frame(height: 120)
            }
            .navigationDestination(for: String.self) { value in
                Text(value).font(.title)
            }
            .navigationTitle("Navigation")
        }
        .frame(minHeight: 320)
    }
}

struct PresentationDemo: View {
    @State private var sheet = false
    @State private var popover = false
    @State private var alert = false
    @State private var dialog = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button("Show sheet") { sheet = true }
                .buttonStyle(.borderedProminent)
            Button("Show popover") { popover = true }
            Button("Show alert") { alert = true }
            Button("Show confirmation dialog") { dialog = true }
        }
        .sheet(isPresented: $sheet) {
            VStack(spacing: 20) {
                Text("Sheet").font(.title)
                Text("presentationDetents and drag indicators configure supported sheets.")
            }
            .padding()
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
        .popover(isPresented: $popover) {
            Text("Popover content")
                .padding()
        }
        .alert("Alert", isPresented: $alert) {
            Button("OK") { }
        } message: {
            Text("Alerts present important information.")
        }
        .confirmationDialog("Choose an action", isPresented: $dialog) {
            Button("Archive") { }
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Action", systemImage: "plus") { }
            }
        }
    }
}

struct ListAPIDemo: View {
    @State private var items = ["Text", "Image", "Button", "List"]

    var body: some View {
        List {
            Section("Editable rows") {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                items.removeAll { $0 == item }
                            }
                        }
                }
                .onMove { source, destination in
                    items.move(fromOffsets: source, toOffset: destination)
                }
            }

            Section("OutlineGroup") {
                OutlineGroup(DemoNode.sample, children: \.children) { node in
                    Label(node.name, systemImage: node.children == nil ? "doc" : "folder")
                }
            }
        }
        .toolbar { EditButton() }
        .frame(minHeight: 360)
    }
}

struct DemoNode: Identifiable {
    let id = UUID()
    let name: String
    var children: [DemoNode]?

    static let sample = [
        DemoNode(name: "Views", children: [DemoNode(name: "Text"), DemoNode(name: "Image")]),
        DemoNode(name: "Controls", children: [DemoNode(name: "Button"), DemoNode(name: "Toggle")])
    ]
}

struct TableAPIDemo: View {
    private let rows = [
        APIStat(name: "Text", category: "Views", live: true),
        APIStat(name: "Button", category: "Controls", live: true),
        APIStat(name: "App", category: "App Structure", live: false)
    ]

    var body: some View {
        #if os(macOS)
        Table(rows) {
            TableColumn("API", value: \.name)
            TableColumn("Category", value: \.category)
            TableColumn("Demo") { row in
                Image(systemName: row.live ? "play.circle.fill" : "doc.text")
            }
        }
        .frame(height: 220)
        #else
        List(rows) { row in
            LabeledContent(row.name, value: row.category)
        }
        .frame(height: 220)
        #endif
    }
}

struct APIStat: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let live: Bool
}

