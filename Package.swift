// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FireLoyaltyKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FireLoyaltyKit",
            targets: ["FireLoyaltyKit"]
        )
    ],
    targets: [
        .target(
            name: "FireLoyaltyKit",
            path: "FireLoyaltyKit/FireLoyaltyKit/Sources",
            linkerSettings: [
                .linkedFramework("Security")
            ]
        ),
    ]
)
