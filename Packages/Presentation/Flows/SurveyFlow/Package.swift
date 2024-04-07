// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SurveyFlow",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "SurveyFlow", targets: ["SurveyFlow"]),
    ],
    dependencies: [
        // API
        .package(name: "SurveyFlowDataAPI", path: "../../../Data/Flows/API/SurveyFlowDataAPI"),
        
    ],
    targets: [
        .target(
            name: "SurveyFlow",
            dependencies: [
                // API
                .product(name: "SurveyFlowDataAPI", package: "SurveyFlowDataAPI"),
                
            ]
        ),
        .testTarget(
            name: "SurveyFlowTests",
            dependencies: ["SurveyFlow"]
        ),
    ]
)
