// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "VaporApp",
    products: [
        .library(name: "AuthTemplate", targets: ["AuthTemplate"]),
        .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.2.0")),
        .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.1.0")),
        .package(url: "https://github.com/vapor/auth-provider.git", .upToNextMajor(from: "1.2.1")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "LeafProvider", "AuthProvider"],
                exclude: [
                    "Config",
                    "Database",
                    "Public",
                    "Resources"
            ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)


/*
import PackageDescription

let package = Package(
    name: "VaporApp",
    targets: [
        Target(name: "App"),
        Target(name: "Run", dependencies: ["App"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/vapor/fluent-provider.git", majorVersion: 1),
        .Package(url: "https://github.com/vapor/auth-provider.git", majorVersion: 1)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)
*/
