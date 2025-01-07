// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "SwiftTerm",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "SwiftTermFuzz", targets: ["SwiftTermFuzz"]),
        //.executable(name: "CaptureOutput", targets: ["CaptureOutput"]),
        .library(
            name: "SwiftTerm",
            targets: ["SwiftTerm"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftTerm",
            dependencies: [],
            path: "Sources/SwiftTerm"
        ),
        .executableTarget (
            name: "SwiftTermFuzz",
            dependencies: ["SwiftTerm"],
            path: "Sources/SwiftTermFuzz"
        ),
        .testTarget(
            name: "SwiftTermTests",
            dependencies: ["SwiftTerm"],
            path: "Tests/SwiftTermTests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
