import SwiftUI

struct ShapesDemo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                Rectangle().fill(.blue.gradient)
                RoundedRectangle(cornerRadius: 12).fill(.green.gradient)
                Circle().fill(.orange.gradient)
                Ellipse().fill(.purple.gradient)
                Capsule().fill(.pink.gradient)
            }
            .frame(height: 86)

            Path { path in
                path.move(to: CGPoint(x: 20, y: 80))
                path.addCurve(to: CGPoint(x: 220, y: 80), control1: CGPoint(x: 80, y: 0), control2: CGPoint(x: 160, y: 140))
            }
            .stroke(.indigo, style: StrokeStyle(lineWidth: 6, lineCap: .round))
            .frame(height: 100)
        }
    }
}

struct GradientsCanvasDemo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
                RadialGradient(colors: [.blue, .clear], center: .center, startRadius: 10, endRadius: 70)
                AngularGradient(colors: [.pink, .purple, .blue, .pink], center: .center)
            }
            .frame(height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            TimelineView(.animation) { timeline in
                Canvas { context, size in
                    let seconds = timeline.date.timeIntervalSinceReferenceDate
                    let x = size.width * (0.5 + 0.35 * cos(seconds))
                    let rect = CGRect(x: x - 28, y: size.height / 2 - 28, width: 56, height: 56)
                    context.fill(Path(ellipseIn: rect), with: .color(.teal))
                    context.stroke(Path(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: 8), with: .color(.secondary))
                }
            }
            .frame(height: 140)
        }
    }
}

struct ViewModifiersDemo: View {
    @State private var blurred = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Toggle("Blur", isOn: $blurred.animation())
            Text("Modifiers compose")
                .font(.title.bold())
                .padding()
                .foregroundStyle(.white)
                .background(.blue.gradient, in: RoundedRectangle(cornerRadius: 8))
                .overlay(alignment: .topTrailing) {
                    Image(systemName: "sparkle")
                        .padding(6)
                        .background(.thinMaterial, in: Circle())
                        .offset(x: 10, y: -10)
                }
                .shadow(radius: 8)
                .blur(radius: blurred ? 3 : 0)
                .frame(maxWidth: .infinity)
        }
    }
}

struct AnimationDemo: View {
    @Namespace private var namespace
    @State private var expanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Button("Toggle animation") {
                withAnimation(.spring(response: 0.45, dampingFraction: 0.7)) {
                    expanded.toggle()
                }
            }
            .buttonStyle(.borderedProminent)

            HStack {
                if expanded {
                    Spacer()
                }
                RoundedRectangle(cornerRadius: expanded ? 24 : 8)
                    .fill(.orange.gradient)
                    .matchedGeometryEffect(id: "shape", in: namespace)
                    .frame(width: expanded ? 160 : 80, height: expanded ? 80 : 160)
                if !expanded {
                    Spacer()
                }
            }
            .frame(height: 180)

            PhaseAnimator([0.75, 1.0, 1.25]) { phase in
                Image(systemName: "swift")
                    .font(.system(size: 46))
                    .scaleEffect(phase)
                    .foregroundStyle(.orange)
            } animation: { _ in
                .easeInOut(duration: 0.8)
            }
        }
    }
}

struct GesturesDemo: View {
    @State private var offset: CGSize = .zero
    @State private var taps = 0
    @State private var pressed = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Taps: \(taps)")
            RoundedRectangle(cornerRadius: 14)
                .fill(pressed ? .green.gradient : .blue.gradient)
                .frame(width: 120, height: 120)
                .overlay(Text("Drag").bold().foregroundStyle(.white))
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { offset = $0.translation }
                        .onEnded { _ in withAnimation(.spring()) { offset = .zero } }
                )
                .onTapGesture { taps += 1 }
                .onLongPressGesture {
                    withAnimation {
                        pressed.toggle()
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 180)
        }
    }
}

struct FocusDemo: View {
    enum Field {
        case name, password, notes
    }

    @State private var name = ""
    @State private var password = ""
    @State private var notes = "TextEditor supports longer input."
    @FocusState private var focused: Field?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .focused($focused, equals: .name)
                .submitLabel(.next)
                .onSubmit { focused = .password }
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .focused($focused, equals: .password)
                .submitLabel(.next)
                .onSubmit { focused = .notes }
            TextEditor(text: $notes)
                .focused($focused, equals: .notes)
                .frame(height: 120)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(.quaternary))
            ControlGroup {
                Button("Name") { focused = .name }
                Button("Password") { focused = .password }
                Button("Notes") { focused = .notes }
            }
        }
    }
}

struct StorageDemo: View {
    @AppStorage("showcaseCounter") private var counter = 0
    @SceneStorage("showcaseDraft") private var draft = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Stepper("@AppStorage counter: \(counter)", value: $counter)
            TextField("@SceneStorage draft", text: $draft)
                .textFieldStyle(.roundedBorder)
            Text("AppStorage survives app launches; SceneStorage is tied to scene restoration.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .onReceive(NotificationCenter.default.publisher(for: .resetDemoState)) { _ in
            counter = 0
            draft = ""
        }
    }
}

struct EnvironmentDemo: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.locale) private var locale

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            LabeledContent("Color scheme", value: String(describing: colorScheme))
            LabeledContent("Dynamic type", value: String(describing: dynamicTypeSize))
            LabeledContent("Locale", value: locale.identifier)
            Text("Environment values flow down the view tree and can be overridden with .environment.")
                .foregroundStyle(.secondary)
        }
    }
}

private struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct PreferencesDemo: View {
    @State private var measuredWidth: CGFloat = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Measured child width: \(measuredWidth, format: .number.precision(.fractionLength(0)))")
            Text("PreferenceKey")
                .font(.title.bold())
                .background {
                    GeometryReader { proxy in
                        Color.clear.preference(key: WidthPreferenceKey.self, value: proxy.size.width)
                    }
                }
            Text("Child views can report measurements or preferences to ancestors.")
                .foregroundStyle(.secondary)
        }
        .onPreferenceChange(WidthPreferenceKey.self) { measuredWidth = $0 }
    }
}

struct LifecycleDemo: View {
    @State private var log: [String] = []
    @State private var value = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Stepper("Value \(value)", value: $value)
            List(log, id: \.self) { item in
                Text(item)
            }
            .frame(height: 160)
        }
        .onAppear { append("onAppear") }
        .onDisappear { append("onDisappear") }
        .onChange(of: value) { _, newValue in append("onChange \(newValue)") }
        .task {
            append("task started")
        }
    }

    private func append(_ message: String) {
        log.insert("\(Date.now.formatted(date: .omitted, time: .standard)): \(message)", at: 0)
        log = Array(log.prefix(6))
    }
}

struct AccessibilityDemo: View {
    @State private var value = 3

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Stepper("Priority \(value)", value: $value, in: 1...5)
                .accessibilityLabel("Priority")
                .accessibilityValue("\(value) of 5")
                .accessibilityHint("Adjusts the priority value")

            Button {
                value = 5
            } label: {
                Label("Max Priority", systemImage: "arrow.up.circle")
            }
            .accessibilityAction(named: "Reset to one") {
                value = 1
            }

            Text("Accessibility modifiers add labels, values, hints, traits, custom actions, identifiers, and navigation order.")
                .foregroundStyle(.secondary)
        }
    }
}

struct CustomLayoutDemo: View {
    @State private var vertical = false

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Toggle("Vertical AnyLayout", isOn: $vertical.animation())
            let layout = vertical ? AnyLayout(VStackLayout(spacing: 12)) : AnyLayout(HStackLayout(spacing: 12))
            layout {
                ForEach(["Layout", "AnyLayout", "ViewThatFits"], id: \.self) { text in
                    Text(text)
                        .padding()
                        .background(.teal.opacity(0.18), in: RoundedRectangle(cornerRadius: 8))
                }
            }

            ViewThatFits {
                HStack { sampleButtons }
                VStack(alignment: .leading) { sampleButtons }
            }
        }
    }

    @ViewBuilder
    private var sampleButtons: some View {
        Button("Primary") { }
        Button("Secondary") { }
        Button("Tertiary") { }
    }
}

