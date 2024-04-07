// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "HomeFlow",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "HomeFlow", targets: ["HomeFlow"]),
    ],
    dependencies: [
        // API
        .package(name: "HomeFlowDataAPI", path: "../../../Data/Flows/API/HomeFlowDataAPI"),
        
        // Shared
        .package(name: "CoreUI", path: "../../Shared/CoreUI"),
    ],
    targets: [
        .target(
            name: "HomeFlow",
            dependencies: [
                // API
                .product(name: "HomeFlowDataAPI", package: "HomeFlowDataAPI"),
                
                // Presentation
                .product(name: "CoreUI", package: "CoreUI"),
            ]
        ),
        .testTarget(
            name: "HomeFlowTests",
            dependencies: ["HomeFlow"]
        ),
    ]
)
