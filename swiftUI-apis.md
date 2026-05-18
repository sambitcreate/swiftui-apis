# SwiftUI APIs Catalog

Source basis: Apple Developer Documentation DocC JSON for SwiftUI, including the SwiftUI framework page, `View` protocol page, category collection pages, and SwiftUI updates. Apple documents SwiftUI as a framework for declaring UI and behavior across iOS, iPadOS, macOS, Mac Catalyst, tvOS, visionOS, and watchOS.

This catalog is intentionally implementation-oriented. The showcase app demonstrates renderable APIs directly and includes reference entries for APIs that are protocols, result builders, style contracts, platform integrations, deprecated APIs, or APIs that require entitlements, StoreKit configuration, MapKit data, documents, widgets, AppKit/UIKit hosts, or visionOS hardware.

## Top-Level SwiftUI Areas

| Area | Purpose | Showcase coverage |
| --- | --- | --- |
| App organization | `App`, scenes, commands, settings, document and window structure | Reference cards and shell `App` implementation |
| Scenes and windows | `WindowGroup`, `DocumentGroup`, `Settings`, `Window`, `MenuBarExtra`, immersive spaces | Reference cards, macOS/visionOS notes |
| Navigation | `NavigationStack`, `NavigationSplitView`, `NavigationLink`, paths, destinations | Live demos |
| Modal presentations | `sheet`, `popover`, `fullScreenCover`, alerts, dialogs, inspector | Live demos where cross-platform |
| Toolbars and commands | `toolbar`, `ToolbarItem`, `ToolbarItemGroup`, `Commands`, `CommandMenu` | Live demos/reference |
| Search | `searchable`, suggestions, search scopes, unavailable content | Live demos |
| Model data | `@State`, `@Binding`, `@Observable`, `@Environment`, `@StateObject`, `@ObservedObject`, `@EnvironmentObject` | Live demos/reference |
| Environment values | Dynamic type, color scheme, locale, dismiss, openURL, edit mode, scene phase, control size | Live demos/reference |
| Preferences | `PreferenceKey`, `anchorPreference`, `transformPreference`, overlay/background preferences | Live demos/reference |
| Persistent storage | `@AppStorage`, `@SceneStorage`, document APIs | Live demos/reference |
| View fundamentals | `View`, `ViewBuilder`, `Group`, `AnyView`, `EmptyView`, `TupleView`, `EquatableView` | Live demos/reference |
| View configuration | identity, tags, disabled, hidden, labels, badges, help, privacy | Live demos |
| View styles | button, toggle, picker, list, form, gauge, progress, label, menu, control group styles | Live demos/reference |
| Animations | implicit, explicit, transitions, matched geometry, phase/keyframe animators | Live demos |
| Text input/output | `Text`, `Label`, `TextField`, `SecureField`, `TextEditor`, formatting, selection | Live demos |
| Images | `Image`, SF Symbols, `AsyncImage`, image modifiers | Live demos |
| Controls/indicators | `Button`, `Toggle`, `Slider`, `Stepper`, `Picker`, `DatePicker`, `ColorPicker`, `ProgressView`, `Gauge`, `ShareLink`, `PasteButton`, `EditButton`, `RenameButton`, `HelpLink` | Live demos/reference |
| Menus and commands | `Menu`, `MenuButton`, `ContextMenu`, command groups | Live demos/reference |
| Shapes | `Rectangle`, `RoundedRectangle`, `Circle`, `Ellipse`, `Capsule`, `Path`, `ContainerRelativeShape`, `UnevenRoundedRectangle`, `AnyShape` | Live demos |
| Drawing and graphics | gradients, materials, `Canvas`, `TimelineView`, masks, blend modes, shadows, compositing | Live demos |
| Layout fundamentals | stacks, grids, lazy stacks/grids, spacers, dividers, overlays/backgrounds, z-index | Live demos |
| Layout adjustments | frame, padding, position, offset, alignment guides, safe area, layout priority | Live demos |
| Custom layout | `Layout`, `AnyLayout`, `ViewThatFits`, custom alignment, geometry readers | Live demos/reference |
| Lists | `List`, `Section`, `ForEach`, `OutlineGroup`, edit actions, row modifiers | Live demos |
| Tables | `Table`, `TableColumn`, sort/select configuration | Reference/live where available |
| View groupings | `Form`, `GroupBox`, `ControlGroup`, `DisclosureGroup`, `LabeledContent` | Live demos |
| Scroll views | `ScrollView`, `ScrollViewReader`, scroll position, indicators, margins, transitions | Live demos |
| Gestures | tap, long press, drag, magnify, rotate, spatial, simultaneous/exclusive/sequence gestures | Live demos |
| Input events | keyboard shortcuts, submit, hover, focus, commands | Live demos/reference |
| Clipboard | copy, paste, `PasteButton`, transferable | Live demos/reference |
| Drag and drop | draggable, dropDestination, transferable | Live demos/reference |
| Focus | `@FocusState`, focused values, focus sections, default focus | Live demos/reference |
| System events | task, onAppear, onDisappear, onChange, openURL, scenePhase, refreshable | Live demos |
| Accessibility | labels, hints, values, actions, rotors, sort priority, traits, reduce motion/contrast | Live demos/reference |
| Framework integration | UIKit/AppKit/WatchKit representables, hosting controllers, technology-specific views | Reference cards |
| Tool support | previews, library customization, performance analysis | Reference cards |

## Renderable View Types

These are the concrete view or view-like types surfaced in Apple’s `View` conforming-types relationship and category pages. The app includes a live or reference showcase card for each named item.

### Core Content

- `Text` - display styled, localized, formatted, selectable text.
- `Image` - display asset images, SF Symbols, resizable images, rendering modes, interpolation.
- `Label` - combine title and icon with configurable label styles.
- `Link` - open URLs.
- `Color` - render shape style color as a view.
- `ContentUnavailableView` - standard empty, search, and failure states.
- `AnyView` - type erase heterogeneous view values.
- `EmptyView` - render no content.
- `EquatableView` - skip updates when equatable input is unchanged.
- `ModifiedContent` - concrete wrapper created by modifiers.
- `TupleView` - grouped result-builder output.

### Controls and Indicators

- `Button`, `DefaultButtonLabel`, `EditButton`, `RenameButton`, `PasteButton`, `ShareLink`, `HelpLink`, `NewDocumentButton`, `SettingsLink`.
- `Toggle`, `Slider`, `Stepper`, `Picker`, `DatePicker`, `MultiDatePicker`, `ColorPicker`.
- `ProgressView`, `Gauge`.
- `Menu`, `MenuButton`, `ControlGroup`, `DisclosureGroup`.
- `TextField`, `SecureField`, `TextEditor`, `TextFieldLink`.
- `WindowVisibilityToggle`.

### Containers and Layout

- `Group`, `Section`, `ForEach`, `List`, `Form`, `Table`, `OutlineGroup`.
- `VStack`, `HStack`, `ZStack`, `LazyVStack`, `LazyHStack`, `Grid`, `GridRow`, `LazyVGrid`, `LazyHGrid`.
- `Spacer`, `Divider`, `ViewThatFits`, `GeometryReader`, `GeometryReader3D`.
- `ScrollView`, `ScrollViewReader`.
- `NavigationStack`, `NavigationSplitView`, `NavigationView`, `NavigationLink`, `TabView`.
- `GroupBox`, `HSplitView`, `VSplitView`.
- `GlassEffectContainer`, `DocumentLaunchView`, `SubscriptionView`, `PresentedWindowContent`, `PlaceholderContentView`, `PreviewModifierContent`.

### Shapes, Styles, and Drawing

- `Rectangle`, `RoundedRectangle`, `UnevenRoundedRectangle`, `Circle`, `Ellipse`, `Capsule`, `ContainerRelativeShape`, `ConcentricRectangle`.
- `Path`, `AnyShape`, `OffsetShape`, `RotatedShape`, `ScaledShape`, `TransformedShape`.
- `ShapeView`, `FillShapeView`, `StrokeShapeView`, `StrokeBorderShapeView`.
- `LinearGradient`, `RadialGradient`, `AngularGradient`, `EllipticalGradient`, `MeshGradient`.
- `Canvas`, `TimelineView`.
- `Material` values: `.regular`, `.thin`, `.thick`, `.ultraThin`, `.ultraThick`, bar/background variants.

### Animation Views

- `PhaseAnimator`, `KeyframeAnimator`.
- Transitions: opacity, scale, slide, move, offset, asymmetric, combined, blur/scale where available.
- Matched geometry effects with `Namespace`.

### Generated Configuration Views

Apple exposes many generated label/content structs as `View` conformers. They are normally consumed through style protocols rather than directly instantiated:

- `ButtonStyleConfiguration.Label`, `PrimitiveButtonStyleConfiguration.Label`
- `ControlGroupStyleConfiguration.Content`, `ControlGroupStyleConfiguration.Label`
- `DatePickerStyleConfiguration.Label`
- `DisclosureGroupStyleConfiguration.Content`, `DisclosureGroupStyleConfiguration.Label`
- `FormStyleConfiguration.Content`
- `GaugeStyleConfiguration.Label`, `CurrentValueLabel`, `MinimumValueLabel`, `MaximumValueLabel`, `MarkedValueLabel`
- `GroupBoxStyleConfiguration.Content`, `GroupBoxStyleConfiguration.Label`
- `LabelStyleConfiguration.Icon`, `LabelStyleConfiguration.Title`
- `LabeledContentStyleConfiguration.Content`, `LabeledContentStyleConfiguration.Label`
- `MenuStyleConfiguration.Content`, `MenuStyleConfiguration.Label`
- `ProgressViewStyleConfiguration.Label`, `ProgressViewStyleConfiguration.CurrentValueLabel`
- `SectionConfiguration.Actions`
- `ToggleStyleConfiguration.Label`
- `TabContentBuilder.Content`

### Collection and Layout Helper Views

- `EditableCollectionContent`
- `GroupElementsOfContent`
- `GroupSectionsOfContent`
- `LabeledControlGroupContent`
- `LabeledToolbarItemGroupContent`
- `OutlineSubgroupChildren`
- `SearchUnavailableContent.Label`, `.Description`, `.Actions`
- `Subview`, `SubviewsCollection`, `SubviewsCollectionSlice`
- `ZStackContent3D`

## Protocols, Builders, Property Wrappers, and Data APIs

### App and Scene

- `App`, `Scene`, `Commands`, `WindowGroup`, `Window`, `Settings`, `DocumentGroup`, `MenuBarExtra`, `ImmersiveSpace`.
- `SceneBuilder`, `CommandsBuilder`, `ToolbarContentBuilder`, `ViewBuilder`.
- Scene modifiers: `commands`, `defaultSize`, `defaultPosition`, `handlesExternalEvents`, `windowResizability`, `windowStyle`, `restorationBehavior`.

### Data Flow

- `@State`, `@Binding`, `@Bindable`, `@Observable`, `@Environment`, `@EnvironmentObject`, `@ObservedObject`, `@StateObject`, `@AppStorage`, `@SceneStorage`, `@FocusState`, `@FocusedValue`, `@FocusedBinding`, `@Namespace`, `@GestureState`.
- `Binding`, `EnvironmentValues`, `Transaction`, `Animation`, `Namespace.ID`.
- `ObservableObject`, `Published`, `DynamicProperty`, `PreferenceKey`, `FocusedValueKey`, `EnvironmentKey`.

### Layout and Geometry

- `Layout`, `LayoutSubview`, `LayoutSubviews`, `ProposedViewSize`, `LayoutValueKey`, `Alignment`, `HorizontalAlignment`, `VerticalAlignment`, `UnitPoint`, `Edge`, `EdgeInsets`, `Axis`, `Axis.Set`.
- `GeometryProxy`, `Anchor`, `CoordinateSpace`, `ScrollPosition`, `ScrollTargetBehavior`.
- `GridItem`, `GridItem.Size`.

### Gesture APIs

- `Gesture`, `TapGesture`, `LongPressGesture`, `DragGesture`, `MagnifyGesture`, `MagnificationGesture`, `RotateGesture`, `RotationGesture`, `SpatialTapGesture`, `HoverGesture`.
- `SequenceGesture`, `SimultaneousGesture`, `ExclusiveGesture`, `AnyGesture`.
- Gesture modifiers: `gesture`, `highPriorityGesture`, `simultaneousGesture`, `onTapGesture`, `onLongPressGesture`.

### Styling Protocols

- `ButtonStyle`, `PrimitiveButtonStyle`, `ToggleStyle`, `PickerStyle`, `DatePickerStyle`, `ProgressViewStyle`, `GaugeStyle`, `LabelStyle`, `MenuStyle`, `ControlGroupStyle`, `GroupBoxStyle`, `DisclosureGroupStyle`, `LabeledContentStyle`, `ListStyle`, `TableStyle`, `FormStyle`, `TextFieldStyle`.
- Common built-ins: `.automatic`, `.plain`, `.bordered`, `.borderedProminent`, `.link`, `.menu`, `.segmented`, `.wheel`, `.inline`, `.compact`, `.graphical`, `.linear`, `.circular`, `.palette`, `.iconOnly`, `.titleOnly`, `.titleAndIcon`, `.grouped`, `.inset`, `.insetGrouped`, `.sidebar`, `.carousel`.

### Shape and Drawing Protocols

- `Shape`, `InsettableShape`, `RoundedRectangularShape`, `ShapeStyle`, `FillStyle`, `StrokeStyle`, `Gradient`, `GraphicsContext`, `ImagePaint`, `ForegroundStyle`, `BackgroundStyle`, `SeparatorShapeStyle`, `TintShapeStyle`, `HierarchicalShapeStyle`.

### Representable Integration

- `UIViewRepresentable`, `UIViewControllerRepresentable`, `NSViewRepresentable`, `NSViewControllerRepresentable`, `WKInterfaceObjectRepresentable`.
- Hosting integration: `UIHostingController`, `NSHostingController`, hosting configuration APIs.

## High-Value View Modifiers

The `View` protocol has hundreds of modifiers. The showcase app groups them by behavior and includes examples for the common cross-platform subset.

### Layout

- `frame`, `fixedSize`, `layoutPriority`, `padding`, `safeAreaPadding`, `safeAreaInset`, `ignoresSafeArea`, `containerRelativeFrame`, `aspectRatio`, `scaledToFit`, `scaledToFill`.
- `position`, `offset`, `alignmentGuide`, `zIndex`, `overlay`, `background`, `clipShape`, `mask`.
- `gridCellColumns`, `gridCellAnchor`, `gridColumnAlignment`, `gridCellUnsizedAxes`.
- `scrollDisabled`, `scrollIndicators`, `scrollTargetBehavior`, `scrollTargetLayout`, `scrollPosition`, `scrollTransition`, `contentMargins`, `defaultScrollAnchor`.

### Appearance and Rendering

- `foregroundStyle`, `backgroundStyle`, `tint`, `accentColor`, `opacity`, `blendMode`, `brightness`, `contrast`, `saturation`, `grayscale`, `hueRotation`, `colorInvert`.
- `blur`, `shadow`, `compositingGroup`, `drawingGroup`, `luminanceToAlpha`, `symbolRenderingMode`, `symbolVariant`, `imageScale`, `font`, `fontDesign`, `fontWeight`, `fontWidth`.
- `glassEffect`, `glassBackgroundEffect`, `material`, `containerShape`.

### Text and Symbols

- `bold`, `italic`, `monospaced`, `monospacedDigit`, `strikethrough`, `underline`, `kerning`, `tracking`, `baselineOffset`.
- `lineLimit`, `lineSpacing`, `minimumScaleFactor`, `allowsTightening`, `truncationMode`, `multilineTextAlignment`, `textSelection`, `textCase`.
- `labelStyle`, `controlSize`, `controlProminence`.

### Interaction and State

- `disabled`, `allowsHitTesting`, `contentShape`, `hoverEffect`, `onHover`, `onTapGesture`, `onLongPressGesture`, `gesture`, `highPriorityGesture`, `simultaneousGesture`.
- `keyboardShortcut`, `focusable`, `focused`, `submitLabel`, `onSubmit`, `refreshable`, `swipeActions`, `contextMenu`.
- `draggable`, `dropDestination`, `onDrag`, `onDrop`, `copyable`, `pasteDestination`.

### Presentation

- `sheet`, `popover`, `fullScreenCover`, `alert`, `confirmationDialog`, `dialogIcon`, `dialogSuppressionToggle`, `fileExporter`, `fileImporter`, `fileMover`, `quickLookPreview`.
- `presentationDetents`, `presentationDragIndicator`, `presentationBackground`, `presentationCornerRadius`, `presentationCompactAdaptation`, `interactiveDismissDisabled`.
- `navigationTitle`, `navigationSubtitle`, `navigationBarTitleDisplayMode`, `navigationDestination`, `navigationSplitViewStyle`, `toolbar`, `toolbarRole`, `toolbarBackground`, `toolbarColorScheme`, `toolbarTitleMenu`, `tabItem`, `badge`.

### Lifecycle and Tasks

- `onAppear`, `onDisappear`, `task`, `onChange`, `onReceive`, `transaction`, `environment`, `environmentObject`, `transformEnvironment`, `preference`, `transformPreference`.

### Animation

- `animation`, `transition`, `matchedGeometryEffect`, `phaseAnimator`, `keyframeAnimator`, `contentTransition`, `symbolEffect`.

### Accessibility

- `accessibilityLabel`, `accessibilityHint`, `accessibilityValue`, `accessibilityIdentifier`, `accessibilityAddTraits`, `accessibilityRemoveTraits`, `accessibilityHidden`.
- `accessibilityElement`, `accessibilityChildren`, `accessibilityRepresentation`, `accessibilityAction`, `accessibilityActions`, `accessibilitySortPriority`, `accessibilityRotor`.

### Platform and Framework-Specific Modifiers

- MapKit SwiftUI: `mapControls`, `mapControlVisibility`, `mapStyle`, map item detail and look-around presentation modifiers.
- StoreKit SwiftUI: subscription store presentation and styling modifiers.
- RealityKit/visionOS: `realityViewLayoutBehavior`, `onWorldRecenter`, immersive presentation helpers, ornaments.
- Image Playground and Apple Intelligence-related presentation/configuration modifiers where available.

## Showcase Implementation Plan

The app presents APIs one by one with:

- A searchable sidebar/list of API entries.
- Category tabs for quick scanning.
- A detail page with API name, category, availability note, source summary, and either a live SwiftUI demo or reference implementation note.
- Stateful demos for controls, forms, lists, navigation, presentation, drawing, gestures, layout, storage, accessibility, and lifecycle.
- Reference-only cards for protocols, generated configuration types, platform-specific APIs, deprecated APIs, or APIs requiring external framework setup.

