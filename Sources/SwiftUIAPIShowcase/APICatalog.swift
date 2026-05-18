import Foundation

enum APICatalog {
    static let entries: [APIEntry] = liveEntries + referenceEntries + generatedReferenceEntries

    static let liveEntries: [APIEntry] = [
        APIEntry("Text", category: .views, summary: "Displays styled, formatted, selectable text.", demo: .text, code: "Text(\"SwiftUI\").font(.title).bold()"),
        APIEntry("Image", category: .views, summary: "Displays images and SF Symbols.", demo: .image, code: "Image(systemName: \"swift\")"),
        APIEntry("Label", category: .views, summary: "Combines a title and icon.", demo: .labelsLinks, code: "Label(\"Inbox\", systemImage: \"tray\")"),
        APIEntry("Link", category: .views, summary: "Opens an external URL.", demo: .labelsLinks, code: "Link(\"Apple\", destination: url)"),
        APIEntry("ContentUnavailableView", category: .views, summary: "Standard empty and search result state.", demo: .labelsLinks),
        APIEntry("Button", category: .controls, summary: "Runs an action when triggered.", demo: .controls),
        APIEntry("Toggle", category: .controls, summary: "Edits a Boolean value.", demo: .controls),
        APIEntry("Slider", category: .controls, summary: "Selects a numeric value from a range.", demo: .controls),
        APIEntry("Stepper", category: .controls, summary: "Incrementally adjusts a numeric value.", demo: .controls),
        APIEntry("Picker", category: .controls, summary: "Selects one value from many options.", demo: .pickers),
        APIEntry("DatePicker", category: .controls, summary: "Selects dates and times.", demo: .datesColors),
        APIEntry("MultiDatePicker", category: .controls, summary: "Selects multiple dates.", demo: .datesColors),
        APIEntry("ColorPicker", category: .controls, summary: "Selects a color.", demo: .datesColors),
        APIEntry("ProgressView", category: .controls, summary: "Shows progress or activity.", demo: .progressGauge),
        APIEntry("Gauge", category: .controls, summary: "Shows a value inside a bounded range.", demo: .progressGauge),
        APIEntry("ShareLink", category: .controls, summary: "Invokes system sharing.", demo: .controls),
        APIEntry("PasteButton", category: .controls, summary: "Pastes transferable content from the clipboard.", demo: .controls),
        APIEntry("EditButton", category: .controls, summary: "Toggles list edit mode.", demo: .list),
        APIEntry("Menu", category: .controls, summary: "Shows actions in a compact menu.", demo: .menus),
        APIEntry("ControlGroup", category: .controls, summary: "Groups related controls.", demo: .menus),
        APIEntry("DisclosureGroup", category: .controls, summary: "Shows collapsible content.", demo: .formGrouping),
        APIEntry("TextField", category: .views, summary: "Single-line text input.", demo: .focus),
        APIEntry("SecureField", category: .views, summary: "Secure single-line text input.", demo: .focus),
        APIEntry("TextEditor", category: .views, summary: "Multi-line text input.", demo: .focus),
        APIEntry("VStack", category: .layout, summary: "Arranges children vertically.", demo: .stacks),
        APIEntry("HStack", category: .layout, summary: "Arranges children horizontally.", demo: .stacks),
        APIEntry("ZStack", category: .layout, summary: "Overlays children.", demo: .stacks),
        APIEntry("LazyVStack", category: .layout, summary: "Lazily creates vertical content.", demo: .scroll),
        APIEntry("LazyHStack", category: .layout, summary: "Lazily creates horizontal content.", demo: .scroll),
        APIEntry("Grid", category: .layout, summary: "Two-dimensional layout.", demo: .grids),
        APIEntry("GridRow", category: .layout, summary: "Defines a row inside Grid.", demo: .grids),
        APIEntry("LazyVGrid", category: .layout, summary: "Lazy vertical grid.", demo: .grids),
        APIEntry("LazyHGrid", category: .layout, summary: "Lazy horizontal grid.", demo: .grids),
        APIEntry("Spacer", category: .layout, summary: "Flexible empty space.", demo: .stacks),
        APIEntry("Divider", category: .layout, summary: "Visual separator.", demo: .stacks),
        APIEntry("ViewThatFits", category: .layout, summary: "Chooses the first child that fits.", demo: .customLayout),
        APIEntry("GeometryReader", category: .layout, summary: "Reads parent geometry.", demo: .customLayout),
        APIEntry("AnyLayout", category: .layout, summary: "Type-erased layout container.", demo: .customLayout),
        APIEntry("Layout", category: .layout, summary: "Protocol for custom layout containers.", demo: .customLayout),
        APIEntry("ScrollView", category: .layout, summary: "Scrollable content container.", demo: .scroll),
        APIEntry("ScrollViewReader", category: .layout, summary: "Programmatic scrolling.", demo: .scroll),
        APIEntry("NavigationStack", category: .navigation, summary: "Stack-based navigation.", demo: .navigation),
        APIEntry("NavigationSplitView", category: .navigation, summary: "Multi-column navigation.", demo: .navigation),
        APIEntry("NavigationLink", category: .navigation, summary: "Navigates to a destination.", demo: .navigation),
        APIEntry("TabView", category: .navigation, summary: "Switches between tabs or pages.", demo: .navigation),
        APIEntry("sheet", category: .presentation, summary: "Presents modal content.", demo: .presentation),
        APIEntry("popover", category: .presentation, summary: "Presents anchored content.", demo: .presentation),
        APIEntry("alert", category: .presentation, summary: "Presents an alert.", demo: .presentation),
        APIEntry("confirmationDialog", category: .presentation, summary: "Presents action choices.", demo: .presentation),
        APIEntry("toolbar", category: .presentation, summary: "Adds toolbar items.", demo: .presentation),
        APIEntry("List", category: .lists, summary: "Displays rows in a scrolling list.", demo: .list),
        APIEntry("Section", category: .lists, summary: "Groups list, form, and table content.", demo: .list),
        APIEntry("ForEach", category: .lists, summary: "Creates views from data.", demo: .list),
        APIEntry("OutlineGroup", category: .lists, summary: "Displays tree data.", demo: .list),
        APIEntry("Table", category: .lists, summary: "Displays sortable tabular data where available.", demo: .table),
        APIEntry("Form", category: .layout, summary: "Groups controls for data entry.", demo: .formGrouping),
        APIEntry("GroupBox", category: .layout, summary: "Visually groups related content.", demo: .formGrouping),
        APIEntry("LabeledContent", category: .views, summary: "Pairs a label with content.", demo: .formGrouping),
        APIEntry("Rectangle", category: .drawing, summary: "Rectangular shape.", demo: .shapes),
        APIEntry("RoundedRectangle", category: .drawing, summary: "Rounded rectangle shape.", demo: .shapes),
        APIEntry("UnevenRoundedRectangle", category: .drawing, summary: "Rectangle with independent corner radii.", demo: .shapes),
        APIEntry("Circle", category: .drawing, summary: "Circular shape.", demo: .shapes),
        APIEntry("Ellipse", category: .drawing, summary: "Elliptical shape.", demo: .shapes),
        APIEntry("Capsule", category: .drawing, summary: "Capsule shape.", demo: .shapes),
        APIEntry("Path", category: .drawing, summary: "Custom vector path.", demo: .shapes),
        APIEntry("LinearGradient", category: .drawing, summary: "Linear gradient style.", demo: .gradientsCanvas),
        APIEntry("RadialGradient", category: .drawing, summary: "Radial gradient style.", demo: .gradientsCanvas),
        APIEntry("AngularGradient", category: .drawing, summary: "Angular gradient style.", demo: .gradientsCanvas),
        APIEntry("MeshGradient", category: .drawing, summary: "Mesh gradient style on supported systems."),
        APIEntry("Canvas", category: .drawing, summary: "Immediate-mode drawing surface.", demo: .gradientsCanvas),
        APIEntry("TimelineView", category: .drawing, summary: "Updates content on a schedule.", demo: .gradientsCanvas),
        APIEntry("foregroundStyle", category: .views, summary: "Sets foreground shape styles.", demo: .modifiers),
        APIEntry("background", category: .views, summary: "Layers content behind a view.", demo: .modifiers),
        APIEntry("overlay", category: .views, summary: "Layers content above a view.", demo: .modifiers),
        APIEntry("clipShape", category: .views, summary: "Clips a view to a shape.", demo: .modifiers),
        APIEntry("mask", category: .views, summary: "Masks rendering with another view.", demo: .modifiers),
        APIEntry("shadow", category: .views, summary: "Adds a shadow.", demo: .modifiers),
        APIEntry("blur", category: .views, summary: "Applies blur.", demo: .modifiers),
        APIEntry("blendMode", category: .views, summary: "Changes compositing blend behavior.", demo: .modifiers),
        APIEntry("animation", category: .animation, summary: "Animates value changes.", demo: .animation),
        APIEntry("transition", category: .animation, summary: "Animates insertion and removal.", demo: .animation),
        APIEntry("matchedGeometryEffect", category: .animation, summary: "Animates geometry between views.", demo: .animation),
        APIEntry("PhaseAnimator", category: .animation, summary: "Animates through phases.", demo: .animation),
        APIEntry("KeyframeAnimator", category: .animation, summary: "Defines keyframed animation tracks.", demo: .animation),
        APIEntry("TapGesture", category: .gestures, summary: "Recognizes taps.", demo: .gestures),
        APIEntry("LongPressGesture", category: .gestures, summary: "Recognizes long presses.", demo: .gestures),
        APIEntry("DragGesture", category: .gestures, summary: "Tracks dragging.", demo: .gestures),
        APIEntry("MagnifyGesture", category: .gestures, summary: "Tracks magnification.", demo: .gestures),
        APIEntry("RotateGesture", category: .gestures, summary: "Tracks rotation.", demo: .gestures),
        APIEntry("@FocusState", category: .events, summary: "Binds focus to state.", demo: .focus),
        APIEntry("@AppStorage", category: .data, summary: "Persists values in user defaults.", demo: .storage),
        APIEntry("@SceneStorage", category: .data, summary: "Persists scene-local state.", demo: .storage),
        APIEntry("@Environment", category: .data, summary: "Reads environment values.", demo: .environment),
        APIEntry("PreferenceKey", category: .data, summary: "Propagates child preferences upward.", demo: .preferences),
        APIEntry("task", category: .events, summary: "Runs async work tied to view lifecycle.", demo: .lifecycle),
        APIEntry("onAppear/onDisappear", category: .events, summary: "Responds to visibility lifecycle.", demo: .lifecycle),
        APIEntry("onChange", category: .events, summary: "Responds to value changes.", demo: .lifecycle),
        APIEntry("accessibilityLabel", category: .accessibility, summary: "Names an accessibility element.", demo: .accessibility),
        APIEntry("accessibilityAction", category: .accessibility, summary: "Adds assistive actions.", demo: .accessibility)
    ]

    static let referenceEntries: [APIEntry] = [
        APIEntry("App", category: .appStructure, summary: "Protocol for app entry points.", code: "@main struct MyApp: App { var body: some Scene { WindowGroup { ContentView() } } }"),
        APIEntry("Scene", category: .appStructure, summary: "Protocol for top-level UI groupings."),
        APIEntry("WindowGroup", category: .appStructure, summary: "Creates one or more windows with shared content."),
        APIEntry("Window", category: .appStructure, summary: "Creates a single identifiable window on supported platforms."),
        APIEntry("Settings", category: .appStructure, summary: "Declares macOS settings UI."),
        APIEntry("DocumentGroup", category: .appStructure, summary: "Document-based app scene."),
        APIEntry("MenuBarExtra", category: .appStructure, summary: "macOS menu bar extra scene."),
        APIEntry("ImmersiveSpace", category: .platform, summary: "visionOS immersive scene."),
        APIEntry("Commands", category: .appStructure, summary: "Menu command declarations."),
        APIEntry("CommandMenu", category: .appStructure, summary: "Creates a menu of commands."),
        APIEntry("View", category: .essentials, summary: "Protocol representing part of an app UI."),
        APIEntry("ViewBuilder", category: .essentials, summary: "Result builder for composing views."),
        APIEntry("SceneBuilder", category: .appStructure, summary: "Result builder for scenes."),
        APIEntry("ToolbarContentBuilder", category: .presentation, summary: "Result builder for toolbar content."),
        APIEntry("@State", category: .data, summary: "Local value state owned by a view."),
        APIEntry("@Binding", category: .data, summary: "Two-way connection to external state."),
        APIEntry("@Observable", category: .data, summary: "Macro-backed observable model support."),
        APIEntry("@ObservedObject", category: .data, summary: "Observes an external observable object."),
        APIEntry("@StateObject", category: .data, summary: "Owns an observable object."),
        APIEntry("@EnvironmentObject", category: .data, summary: "Reads shared observable object from environment."),
        APIEntry("@Namespace", category: .animation, summary: "Creates a namespace for matched geometry effects."),
        APIEntry("@GestureState", category: .gestures, summary: "Transient state for gestures."),
        APIEntry("EnvironmentValues", category: .data, summary: "Collection of environment keys."),
        APIEntry("Transaction", category: .animation, summary: "Animation transaction context."),
        APIEntry("ButtonStyle", category: .controls, summary: "Customizes button appearance."),
        APIEntry("PrimitiveButtonStyle", category: .controls, summary: "Customizes button behavior and appearance."),
        APIEntry("ToggleStyle", category: .controls, summary: "Customizes toggle appearance."),
        APIEntry("PickerStyle", category: .controls, summary: "Customizes picker appearance."),
        APIEntry("DatePickerStyle", category: .controls, summary: "Customizes date picker appearance."),
        APIEntry("ProgressViewStyle", category: .controls, summary: "Customizes progress views."),
        APIEntry("GaugeStyle", category: .controls, summary: "Customizes gauges."),
        APIEntry("LabelStyle", category: .views, summary: "Customizes labels."),
        APIEntry("MenuStyle", category: .controls, summary: "Customizes menus."),
        APIEntry("ListStyle", category: .lists, summary: "Customizes list appearance."),
        APIEntry("TableStyle", category: .lists, summary: "Customizes table appearance."),
        APIEntry("Shape", category: .drawing, summary: "Protocol for drawable vector shapes."),
        APIEntry("InsettableShape", category: .drawing, summary: "Shape that can inset itself."),
        APIEntry("ShapeStyle", category: .drawing, summary: "Protocol for fill/stroke styles."),
        APIEntry("StrokeStyle", category: .drawing, summary: "Line stroke configuration."),
        APIEntry("Material", category: .drawing, summary: "System blur/material style."),
        APIEntry("GraphicsContext", category: .drawing, summary: "Canvas drawing context."),
        APIEntry("UIViewRepresentable", category: .integration, summary: "Wraps UIKit views."),
        APIEntry("UIViewControllerRepresentable", category: .integration, summary: "Wraps UIKit view controllers."),
        APIEntry("NSViewRepresentable", category: .integration, summary: "Wraps AppKit views."),
        APIEntry("NSViewControllerRepresentable", category: .integration, summary: "Wraps AppKit view controllers."),
        APIEntry("WKInterfaceObjectRepresentable", category: .integration, summary: "Wraps WatchKit interface objects."),
        APIEntry("GeometryReader3D", category: .platform, summary: "Reads 3D geometry on supported platforms."),
        APIEntry("RealityView", category: .platform, summary: "RealityKit SwiftUI content on visionOS."),
        APIEntry("Map", category: .integration, summary: "MapKit SwiftUI map view."),
        APIEntry("PhotosPicker", category: .integration, summary: "PhotosUI SwiftUI picker."),
        APIEntry("SubscriptionStoreView", category: .integration, summary: "StoreKit SwiftUI subscription merchandising."),
        APIEntry("AnyView", category: .essentials, summary: "Type-erased view wrapper."),
        APIEntry("EmptyView", category: .essentials, summary: "A view with no rendered output."),
        APIEntry("TupleView", category: .essentials, summary: "Result-builder tuple content."),
        APIEntry("ModifiedContent", category: .essentials, summary: "Concrete wrapper produced by modifiers."),
        APIEntry("EquatableView", category: .essentials, summary: "Skips updates when input remains equal."),
        APIEntry("Group", category: .layout, summary: "Groups multiple views without adding layout."),
        APIEntry("ContainerRelativeShape", category: .drawing, summary: "Shape that follows the container shape."),
        APIEntry("ConcentricRectangle", category: .drawing, summary: "Platform shape for concentric rounded rectangles."),
        APIEntry("AnyShape", category: .drawing, summary: "Type-erased shape."),
        APIEntry("OffsetShape", category: .drawing, summary: "Shape transformed by an offset."),
        APIEntry("RotatedShape", category: .drawing, summary: "Shape transformed by rotation."),
        APIEntry("ScaledShape", category: .drawing, summary: "Shape transformed by scale."),
        APIEntry("TransformedShape", category: .drawing, summary: "Shape transformed by an affine transform."),
        APIEntry("FillShapeView", category: .drawing, summary: "Generated view for filled shapes."),
        APIEntry("StrokeShapeView", category: .drawing, summary: "Generated view for stroked shapes."),
        APIEntry("StrokeBorderShapeView", category: .drawing, summary: "Generated view for stroked insettable shape borders."),
        APIEntry("EllipticalGradient", category: .drawing, summary: "Elliptical gradient style."),
        APIEntry("ImagePaint", category: .drawing, summary: "Paints a shape with an image."),
        APIEntry("FillStyle", category: .drawing, summary: "Configures shape fill rules."),
        APIEntry("NavigationView", category: .navigation, summary: "Legacy navigation container."),
        APIEntry("HSplitView", category: .layout, summary: "Horizontal split view on supported platforms."),
        APIEntry("VSplitView", category: .layout, summary: "Vertical split view on supported platforms."),
        APIEntry("GlassEffectContainer", category: .platform, summary: "Coordinates glass effects on supported systems."),
        APIEntry("DocumentLaunchView", category: .appStructure, summary: "Launch view for document-based apps."),
        APIEntry("TextFieldLink", category: .views, summary: "Text-field link affordance on supported systems."),
        APIEntry("WindowVisibilityToggle", category: .appStructure, summary: "Toggles window visibility."),
        APIEntry("NewDocumentButton", category: .appStructure, summary: "Creates documents in document-based apps."),
        APIEntry("DefaultShareLinkLabel", category: .controls, summary: "Default label generated for share links."),
        APIEntry("DefaultSettingsLinkLabel", category: .appStructure, summary: "Default label generated for settings links."),
        APIEntry("DefaultWindowVisibilityToggleLabel", category: .appStructure, summary: "Default label generated for window toggles."),
        APIEntry("ButtonStyleConfiguration.Label", category: .controls, summary: "Generated label view inside button styles."),
        APIEntry("ToggleStyleConfiguration.Label", category: .controls, summary: "Generated label view inside toggle styles."),
        APIEntry("GaugeStyleConfiguration.Label", category: .controls, summary: "Generated label view inside gauge styles."),
        APIEntry("ProgressViewStyleConfiguration.Label", category: .controls, summary: "Generated label view inside progress styles."),
        APIEntry("LabelStyleConfiguration.Icon", category: .views, summary: "Generated icon view inside label styles."),
        APIEntry("LabelStyleConfiguration.Title", category: .views, summary: "Generated title view inside label styles."),
        APIEntry("SectionConfiguration.Actions", category: .lists, summary: "Generated section action content."),
        APIEntry("SearchUnavailableContent.Label", category: .search, summary: "Generated search unavailable label content."),
        APIEntry("SearchUnavailableContent.Description", category: .search, summary: "Generated search unavailable description content."),
        APIEntry("SearchUnavailableContent.Actions", category: .search, summary: "Generated search unavailable action content."),
        APIEntry("Subview", category: .layout, summary: "A subview proxy used by custom layout APIs."),
        APIEntry("SubviewsCollection", category: .layout, summary: "Collection of subviews for layout work."),
        APIEntry("SubviewsCollectionSlice", category: .layout, summary: "Slice of layout subviews."),
        APIEntry("ProposedViewSize", category: .layout, summary: "Proposed size passed into custom layouts."),
        APIEntry("LayoutSubview", category: .layout, summary: "Proxy for measuring and placing a subview."),
        APIEntry("LayoutSubviews", category: .layout, summary: "Collection of subview proxies in custom layouts."),
        APIEntry("LayoutValueKey", category: .layout, summary: "Custom per-subview layout metadata key."),
        APIEntry("Alignment", category: .layout, summary: "Two-dimensional alignment value."),
        APIEntry("HorizontalAlignment", category: .layout, summary: "Horizontal alignment guide."),
        APIEntry("VerticalAlignment", category: .layout, summary: "Vertical alignment guide."),
        APIEntry("UnitPoint", category: .layout, summary: "Normalized point used for anchors and gradients."),
        APIEntry("EdgeInsets", category: .layout, summary: "Insets from view edges."),
        APIEntry("CoordinateSpace", category: .layout, summary: "Names coordinate spaces for geometry and gestures."),
        APIEntry("ScrollPosition", category: .layout, summary: "Programmatic scroll position state."),
        APIEntry("ScrollTargetBehavior", category: .layout, summary: "Controls scroll target snapping."),
        APIEntry("keyboardShortcut", category: .events, summary: "Adds keyboard command activation."),
        APIEntry("onSubmit", category: .events, summary: "Responds to submit actions from input controls."),
        APIEntry("refreshable", category: .events, summary: "Adds pull-to-refresh or platform refresh behavior."),
        APIEntry("draggable", category: .events, summary: "Marks content as draggable."),
        APIEntry("dropDestination", category: .events, summary: "Accepts dropped transferable values."),
        APIEntry("copyable", category: .events, summary: "Supports copy commands for transferable content."),
        APIEntry("pasteDestination", category: .events, summary: "Accepts pasted transferable values."),
        APIEntry("accessibilityRotor", category: .accessibility, summary: "Defines custom rotor navigation."),
        APIEntry("accessibilityRepresentation", category: .accessibility, summary: "Provides an alternate accessibility tree.")
    ]

    static let generatedReferenceEntries: [APIEntry] = {
        guard let url = Bundle.module.url(forResource: "swiftui-api-index", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let symbols = try? JSONDecoder().decode([GeneratedSymbol].self, from: data)
        else {
            return []
        }

        let curatedNames = Set((liveEntries + referenceEntries).map(\.name))
        return symbols.compactMap { symbol in
            guard !curatedNames.contains(symbol.name) else { return nil }
            return APIEntry(
                symbol.name,
                category: category(from: symbol.category),
                summary: symbol.abstract.isEmpty ? "Generated SwiftUI documentation index entry." : symbol.abstract,
                availability: "Generated from Apple Developer Documentation DocC JSON.",
                code: symbol.declaration
            )
        }
    }()

    private static func category(from generatedCategory: String) -> APICategory {
        switch generatedCategory {
        case "Accessibility": .accessibility
        case "Navigation": .navigation
        case "Presentation", "Toolbars": .presentation
        case "Search": .search
        case "Gestures": .gestures
        case "Animations": .animation
        case "Layout", "Scroll views": .layout
        case "Lists", "Tables": .lists
        case "Shapes", "Drawing and graphics", "Images": .drawing
        case "Controls and indicators", "Text input and output": .controls
        case "Environment values", "Preferences", "Persistent storage": .data
        case "App structure": .appStructure
        case "Framework integration": .integration
        case "Platform specific": .platform
        default: .essentials
        }
    }
}

private struct GeneratedSymbol: Decodable {
    let name: String
    let category: String
    let abstract: String
    let declaration: String
}
