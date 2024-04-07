// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TaskFlow",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "TaskFlow", targets: ["TaskFlow"]),
    ],
    dependencies: [
        // API
        .package(name: "TaskFlowDataAPI", path: "../../../Data/Flows/API/TaskFlowDataAPI"),
        
    ],
    targets: [
        .target(
            name: "TaskFlow",
            dependencies: [
                // API
                .product(name: "TaskFlowDataAPI", package: "TaskFlowDataAPI"),
                
            ]
        ),
        .testTarget(
            name: "TaskFlowTests",
            dependencies: ["TaskFlow"]
        ),
    ]
)
