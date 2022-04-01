// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Redactable",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "Redactable",
            targets: ["Redactable"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Redactable",
            dependencies: []),
        .testTarget(
            name: "RedactableTests",
            dependencies: ["Redactable"]),
    ]
)
