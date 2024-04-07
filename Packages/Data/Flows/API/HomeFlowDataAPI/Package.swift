// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "HomeFlowDataAPI",
    products: [
        .library(
            name: "HomeFlowDataAPI",
            targets: ["HomeFlowDataAPI"]
        ),
    ],
    targets: [
        .target(
            name: "HomeFlowDataAPI"),
        .testTarget(
            name: "HomeFlowDataAPITests",
            dependencies: ["HomeFlowDataAPI"]
        ),
    ]
)
