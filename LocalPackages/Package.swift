// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArchitectureSample2",
    platforms: [.iOS(.v17)],
    dependencies: []
)

package.products = [
    .library(name: "Presentation", targets: ["Presentation"])
]

package.targets = [
    .target(name: "Core"),

    .target(
        name: "Infrastructure",
        dependencies: [
            "Core"
        ]
    ),

    .target(
        name: "Domain",
        dependencies: [
            "Core",
            "Infrastructure"
        ]
    ),

    .target(
        name: "Presentation",
        dependencies: [
            "Core",
            "Domain",
        ]
    ),

        .testTarget(
            name: "DomainTests",
            dependencies: [
                "Core",
                "Infrastructure",
                "Domain"
            ]
        ),
]
