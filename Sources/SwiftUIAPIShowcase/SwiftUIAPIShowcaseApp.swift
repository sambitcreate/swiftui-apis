import SwiftUI

@main
struct SwiftUIAPIShowcaseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
            CommandMenu("Showcase") {
                Button("Reset Demo State") {
                    NotificationCenter.default.post(name: .resetDemoState, object: nil)
                }
                .keyboardShortcut("r", modifiers: [.command, .shift])
            }
        }

        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}

extension Notification.Name {
    static let resetDemoState = Notification.Name("ResetDemoState")
}

struct SettingsView: View {
    @AppStorage("preferredAccent") private var preferredAccent = "Blue"

    var body: some View {
        Form {
            Picker("Accent", selection: $preferredAccent) {
                Text("Blue").tag("Blue")
                Text("Green").tag("Green")
                Text("Orange").tag("Orange")
            }
            .pickerStyle(.segmented)
        }
        .padding()
        .frame(width: 360)
    }
}

