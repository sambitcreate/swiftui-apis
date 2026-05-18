import SwiftUI

struct APIDetailView: View {
    let entry: APIEntry

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header

                GroupBox("Summary") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(entry.summary)
                        Label(entry.availability, systemImage: "checkmark.seal")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                GroupBox(entry.demo == nil ? "Reference" : "Live Demo") {
                    DemoFactory.view(for: entry)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                if !entry.code.isEmpty {
                    GroupBox("Minimal Use") {
                        Text(entry.code)
                            .font(.system(.body, design: .monospaced))
                            .textSelection(.enabled)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding()
            .frame(maxWidth: 980, alignment: .leading)
        }
        .navigationTitle(entry.name)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(entry.category.rawValue, systemImage: entry.category.symbolName)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(entry.name)
                .font(.largeTitle.bold())
                .textSelection(.enabled)

            HStack {
                if entry.demo != nil {
                    Label("Runnable in this showcase", systemImage: "play.circle.fill")
                        .foregroundStyle(.green)
                } else {
                    Label("Reference entry", systemImage: "doc.text")
                        .foregroundStyle(.secondary)
                }
            }
            .font(.callout)
        }
    }
}

enum DemoFactory {
    @ViewBuilder
    static func view(for entry: APIEntry) -> some View {
        if let demo = entry.demo {
            switch demo {
            case .text: TextAPIDemo()
            case .image: ImageAPIDemo()
            case .labelsLinks: LabelsLinksDemo()
            case .controls: ControlsDemo()
            case .pickers: PickersDemo()
            case .datesColors: DatesColorsDemo()
            case .progressGauge: ProgressGaugeDemo()
            case .menus: MenusDemo()
            case .formGrouping: FormGroupingDemo()
            case .stacks: StackLayoutDemo()
            case .grids: GridLayoutDemo()
            case .scroll: ScrollAPIDemo()
            case .navigation: NavigationAPIDemo()
            case .presentation: PresentationDemo()
            case .list: ListAPIDemo()
            case .table: TableAPIDemo()
            case .shapes: ShapesDemo()
            case .gradientsCanvas: GradientsCanvasDemo()
            case .modifiers: ViewModifiersDemo()
            case .animation: AnimationDemo()
            case .gestures: GesturesDemo()
            case .focus: FocusDemo()
            case .storage: StorageDemo()
            case .environment: EnvironmentDemo()
            case .preferences: PreferencesDemo()
            case .lifecycle: LifecycleDemo()
            case .accessibility: AccessibilityDemo()
            case .customLayout: CustomLayoutDemo()
            }
        } else {
            ReferenceDemo(entry: entry)
        }
    }
}

struct ReferenceDemo: View {
    let entry: APIEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("This API is documented here as a reference item.", systemImage: "info.circle")
                .font(.headline)
            Text("It is not directly instantiated in a portable live demo because it is a protocol, result-builder artifact, generated configuration type, app/scene declaration, platform-specific API, or requires an external framework setup.")
                .foregroundStyle(.secondary)
            Text(entry.name)
                .font(.system(.title3, design: .monospaced))
                .padding(10)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

