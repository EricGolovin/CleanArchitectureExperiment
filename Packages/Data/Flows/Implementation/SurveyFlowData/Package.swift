// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SurveyFlowData",
    products: [
        .library(name: "SurveyFlowData", targets: ["SurveyFlowData"]),
    ],
    dependencies: [
        // API
        .package(name: "SurveyFlowDataAPI", path: "../../API/SurveyFlowDataAPI"),
        
    ],
    targets: [
        .target(
            name: "SurveyFlowData",
            dependencies: [
                // API
                .product(name: "SurveyFlowDataAPI", package: "SurveyFlowDataAPI"),
                
            ]
        ),
        .testTarget(
            name: "SurveyFlowDataTests",
            dependencies: ["SurveyFlowData"]
        ),
    ]
)
