// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "NetworkBox",
    products: [
        .library(name: "NetworkBox", targets: ["NetworkBox"]),
    ],
    dependencies: [
        // API
        .package(name: "NetworkBoxAPI", path: "../../API/NetworkBoxAPI"),
        
    ],
    targets: [
        .target(
            name: "NetworkBox",
            dependencies: [
                // API
                .product(name: "NetworkBoxAPI", package: "NetworkBoxAPI"),
                
            ]
        ),
        .testTarget(
            name: "NetworkBoxTests",
            dependencies: ["NetworkBox"]
        ),
    ]
)
