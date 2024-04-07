// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "NetworkBoxAPI",
    products: [
        .library(name: "NetworkBoxAPI", targets: ["NetworkBoxAPI"]),
    ],
    targets: [
        .target(name: "NetworkBoxAPI"),
        .testTarget(
            name: "NetworkBoxAPITests",
            dependencies: ["NetworkBoxAPI"]
        ),
    ]
)
