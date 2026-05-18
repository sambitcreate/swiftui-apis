// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftUIAPIShowcase",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .executable(name: "SwiftUIAPIShowcase", targets: ["SwiftUIAPIShowcase"])
    ],
    targets: [
        .executableTarget(
            name: "SwiftUIAPIShowcase",
            path: "Sources/SwiftUIAPIShowcase"
        )
    ]
)

