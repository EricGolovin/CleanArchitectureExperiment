// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AppFlow",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "AppFlow", targets: ["AppFlow"]),
    ],
    targets: [
        .target(
            name: "AppFlow"
        ),
        .testTarget(
            name: "AppFlowTests",
            dependencies: ["AppFlow"]
        ),
    ]
)
