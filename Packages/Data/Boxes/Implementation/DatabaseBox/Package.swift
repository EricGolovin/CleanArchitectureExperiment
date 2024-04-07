// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "DatabaseBox",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "DatabaseBox", targets: ["DatabaseBox"]),
    ],
    dependencies: [
        // API
        .package(name: "DatabaseBoxAPI", path: "../../API/DatabaseBoxAPI"),
        
    ],
    targets: [
        .target(
            name: "DatabaseBox",
            dependencies: [
                // API
                .product(name: "DatabaseBoxAPI", package: "DatabaseBoxAPI"),
                
            ]
        ),
        .testTarget(
            name: "DatabaseBoxTests",
            dependencies: ["DatabaseBox"]
        ),
    ]
)
