// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "DatabaseBoxAPI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "DatabaseBoxAPI", targets: ["DatabaseBoxAPI"]),
    ],
    targets: [
        .target(name: "DatabaseBoxAPI"),
        .testTarget(
            name: "DatabaseBoxAPITests",
            dependencies: ["DatabaseBoxAPI"]
        ),
    ]
)
