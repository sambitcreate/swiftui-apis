import SwiftUI

enum APICategory: String, CaseIterable, Identifiable {
    case essentials = "Essentials"
    case appStructure = "App Structure"
    case data = "Data and Storage"
    case views = "Views"
    case controls = "Controls"
    case layout = "Layout"
    case navigation = "Navigation"
    case presentation = "Presentation"
    case lists = "Lists and Tables"
    case drawing = "Drawing"
    case animation = "Animation"
    case gestures = "Gestures"
    case events = "Events"
    case accessibility = "Accessibility"
    case integration = "Integration"
    case platform = "Platform Specific"

    var id: String { rawValue }

    var symbolName: String {
        switch self {
        case .essentials: "sparkles"
        case .appStructure: "macwindow"
        case .data: "tray.full"
        case .views: "text.rectangle"
        case .controls: "slider.horizontal.3"
        case .layout: "square.grid.3x3"
        case .navigation: "point.topleft.down.curvedto.point.bottomright.up"
        case .presentation: "rectangle.on.rectangle"
        case .lists: "list.bullet.rectangle"
        case .drawing: "paintpalette"
        case .animation: "circle.dashed"
        case .gestures: "hand.tap"
        case .events: "keyboard"
        case .accessibility: "accessibility"
        case .integration: "arrow.triangle.2.circlepath"
        case .platform: "switch.2"
        }
    }
}

enum DemoKind: String, CaseIterable, Hashable {
    case text
    case image
    case labelsLinks
    case controls
    case pickers
    case datesColors
    case progressGauge
    case menus
    case formGrouping
    case stacks
    case grids
    case scroll
    case navigation
    case presentation
    case list
    case table
    case shapes
    case gradientsCanvas
    case modifiers
    case animation
    case gestures
    case focus
    case storage
    case environment
    case preferences
    case lifecycle
    case accessibility
    case customLayout
}

struct APIEntry: Identifiable, Hashable {
    let id: String
    let name: String
    let category: APICategory
    let summary: String
    let availability: String
    let demo: DemoKind?
    let code: String

    init(
        _ name: String,
        category: APICategory,
        summary: String,
        availability: String = "See Apple documentation for per-platform availability.",
        demo: DemoKind? = nil,
        code: String = ""
    ) {
        self.id = name
        self.name = name
        self.category = category
        self.summary = summary
        self.availability = availability
        self.demo = demo
        self.code = code
    }
}

