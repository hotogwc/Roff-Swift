// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RoffSwift",
    products: [
        .library(
            name: "RoffSwift",
            targets: ["RoffSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kareman/SwiftShell", from: "4.0.0"),
        .package(url: "https://github.com/johnsundell/files.git",from: "1.0.0")
    ],
    targets: [
        .target(
            name: "RoffSwift",
            dependencies: []),
        .testTarget(
            name: "RoffSwiftTests",
            dependencies: ["RoffSwift", "SwiftShell", "Files"]),
    ]
)
