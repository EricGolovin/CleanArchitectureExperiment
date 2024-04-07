// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SurveyFlowDataAPI",
    products: [
        .library(
            name: "SurveyFlowDataAPI",
            targets: ["SurveyFlowDataAPI"]
        ),
    ],
    targets: [
        .target(
            name: "SurveyFlowDataAPI"),
        .testTarget(
            name: "SurveyFlowDataAPITests",
            dependencies: ["SurveyFlowDataAPI"]
        ),
    ]
)
