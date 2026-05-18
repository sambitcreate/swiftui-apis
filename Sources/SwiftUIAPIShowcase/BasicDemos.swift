import SwiftUI

struct DemoPanel<Content: View>: View {
    let title: String
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
            content
        }
        .padding()
        .background(.background, in: RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.quaternary)
        }
    }
}

struct TextAPIDemo: View {
    @State private var selectable = true

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Toggle("Text selection", isOn: $selectable)
            Text("SwiftUI Text")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundStyle(.blue.gradient)
            Text("Formatting supports **Markdown**, dates like \(Date.now, style: .date), monospaced digits 12345, line limits, dynamic type, and selection.")
                .font(.body)
                .lineSpacing(4)
                .textSelection(selectable ? .enabled : .disabled)
            Text("Uppercase caption")
                .font(.caption)
                .textCase(.uppercase)
                .tracking(1.5)
                .foregroundStyle(.secondary)
        }
    }
}

struct ImageAPIDemo: View {
    @State private var scale: Image.Scale = .large

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Picker("Scale", selection: $scale) {
                Text("Small").tag(Image.Scale.small)
                Text("Medium").tag(Image.Scale.medium)
                Text("Large").tag(Image.Scale.large)
            }
            .pickerStyle(.segmented)

            HStack(spacing: 20) {
                Image(systemName: "swift")
                    .symbolRenderingMode(.hierarchical)
                    .imageScale(scale)
                    .font(.system(size: 72))
                    .foregroundStyle(.orange)

                Image(systemName: "rainbow")
                    .symbolRenderingMode(.multicolor)
                    .imageScale(scale)
                    .font(.system(size: 72))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct LabelsLinksDemo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Label with title and icon", systemImage: "tag")
                .labelStyle(.titleAndIcon)
            HStack {
                Label("Icon only", systemImage: "star.fill")
                    .labelStyle(.iconOnly)
                Label("Title only", systemImage: "star")
                    .labelStyle(.titleOnly)
            }
            Link(destination: URL(string: "https://developer.apple.com/documentation/swiftui")!) {
                Label("Open SwiftUI documentation", systemImage: "safari")
            }
            ContentUnavailableView.search(text: "MeshGradient")
                .frame(minHeight: 180)
        }
    }
}

struct ControlsDemo: View {
    @State private var enabled = true
    @State private var volume = 0.45
    @State private var count = 2
    @State private var taps = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                taps += 1
            } label: {
                Label("Button tapped \(taps)", systemImage: "hand.tap")
            }
            .buttonStyle(.borderedProminent)

            Toggle("Enabled", isOn: $enabled)
            Slider(value: $volume) {
                Text("Volume")
            } minimumValueLabel: {
                Image(systemName: "speaker")
            } maximumValueLabel: {
                Image(systemName: "speaker.wave.3")
            }
            Stepper("Count: \(count)", value: $count, in: 0...10)
            ShareLink(item: "SwiftUI API Showcase")
        }
        .disabled(!enabled)
    }
}

struct PickersDemo: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case vanilla, matcha, chocolate
        var id: String { rawValue }
    }

    @State private var flavor: Flavor = .matcha
    @State private var style = "Segmented"

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Picker("Flavor", selection: $flavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized).tag(flavor)
                }
            }
            .pickerStyle(.segmented)

            Picker("Style", selection: $style) {
                Text("Segmented").tag("Segmented")
                Text("Menu").tag("Menu")
                Text("Inline").tag("Inline")
            }
            Text("Selected \(flavor.rawValue) using \(style).")
                .foregroundStyle(.secondary)
        }
    }
}

struct DatesColorsDemo: View {
    @State private var date = Date.now
    @State private var color = Color.indigo

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
            ColorPicker("Color", selection: $color)
            RoundedRectangle(cornerRadius: 8)
                .fill(color.gradient)
                .frame(height: 80)
        }
    }
}

struct ProgressGaugeDemo: View {
    @State private var progress = 0.62

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Slider(value: $progress)
            ProgressView("Progress", value: progress)
            Gauge(value: progress) {
                Text("Capacity")
            } currentValueLabel: {
                Text(progress, format: .percent.precision(.fractionLength(0)))
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.green)
        }
    }
}

struct MenusDemo: View {
    @State private var choice = "None"

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Menu {
                Button("Duplicate", systemImage: "plus.square.on.square") { choice = "Duplicate" }
                Button("Archive", systemImage: "archivebox") { choice = "Archive" }
                Divider()
                Button("Delete", systemImage: "trash", role: .destructive) { choice = "Delete" }
            } label: {
                Label("Menu", systemImage: "ellipsis.circle")
            }

            ControlGroup {
                Button { choice = "Bold" } label: { Image(systemName: "bold") }
                Button { choice = "Italic" } label: { Image(systemName: "italic") }
                Button { choice = "Underline" } label: { Image(systemName: "underline") }
            }
            Text("Last action: \(choice)")
                .foregroundStyle(.secondary)
        }
    }
}

struct FormGroupingDemo: View {
    @State private var notifications = true
    @State private var expanded = true

    var body: some View {
        Form {
            Section("Account") {
                LabeledContent("Plan", value: "Developer")
                Toggle("Notifications", isOn: $notifications)
            }

            GroupBox("GroupBox") {
                DisclosureGroup("Advanced", isExpanded: $expanded) {
                    Text("DisclosureGroup reveals secondary controls.")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .formStyle(.grouped)
        .frame(minHeight: 260)
    }
}

