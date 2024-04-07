// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CoreUI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "CoreUI", targets: ["CoreUI"]),
    ],
    targets: [
        .target(name: "CoreUI"),
        .testTarget(
            name: "CoreUITests",
            dependencies: ["CoreUI"]
        ),
    ]
)
