// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TaskFlowData",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "TaskFlowData", targets: ["TaskFlowData"]),
    ],
    dependencies: [
        // API
        .package(name: "TaskFlowDataAPI", path: "../../API/TaskFlowDataAPI"),
        
        // Boxes
        .package(name: "DatabaseBoxAPI", path: "../../../Boxes/API/DatabaseBoxAPI"),
    ],
    targets: [
        .target(
            name: "TaskFlowData",
            dependencies: [
                // API
                .product(name: "TaskFlowDataAPI", package: "TaskFlowDataAPI"),
                
                // Boxes
                .product(name: "DatabaseBoxAPI", package: "DatabaseBoxAPI")
            ]
        ),
        .testTarget(
            name: "TaskFlowDataTests",
            dependencies: ["TaskFlowData"]
        ),
    ]
)
