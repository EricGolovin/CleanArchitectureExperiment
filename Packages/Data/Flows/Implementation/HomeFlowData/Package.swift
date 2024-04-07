// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "HomeFlowData",
    products: [
        .library(name: "HomeFlowData", targets: ["HomeFlowData"]),
    ],
    dependencies: [
        // API
        .package(name: "HomeFlowDataAPI", path: "../../API/HomeFlowDataAPI"),
        
        // Boxes
        .package(name: "NetworkBoxAPI", path: "../../../Boxes/API/NetworkBoxAPI"),
    ],
    targets: [
        .target(
            name: "HomeFlowData",
            dependencies: [
                // API
                .product(name: "HomeFlowDataAPI", package: "HomeFlowDataAPI"),
                
                // Boxes
                .product(name: "NetworkBoxAPI", package: "NetworkBoxAPI")
            ]
        ),
        .testTarget(
            name: "HomeFlowDataTests",
            dependencies: ["HomeFlowData"]
        ),
    ]
)
