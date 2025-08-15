// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "nanda-swift-sdk",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "nanda-swift-sdk",
            targets: ["nanda-swift-sdk"]
        ),
        .executable(
            name: "NandaAgentCLI",
            targets: ["NandaAgentCLI"]
        ),
        .executable(
            name: "NandaSwiftAgent",
            targets: ["NandaSwiftAgent"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.92.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0")
    ],
    targets: [
        .target(
            name: "nanda-swift-sdk"
        ),
        .executableTarget(
            name: "NandaAgentCLI",
            dependencies: [
                "nanda-swift-sdk",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .executableTarget(
            name: "NandaSwiftAgent",
            dependencies: [
                "nanda-swift-sdk",
                .product(name: "Vapor", package: "vapor")
            ],
            path: "Sources/NandaSwiftAgent"
        ),
        .testTarget(
            name: "nanda-swift-sdkTests",
            dependencies: [
                "nanda-swift-sdk"
            ]
        )
    ]
)
