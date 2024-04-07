// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TaskFlowDataAPI",
    products: [
        .library(
            name: "TaskFlowDataAPI",
            targets: ["TaskFlowDataAPI"]
        ),
    ],
    targets: [
        .target(
            name: "TaskFlowDataAPI"),
        .testTarget(
            name: "TaskFlowDataAPITests",
            dependencies: ["TaskFlowDataAPI"]
        ),
    ]
)
