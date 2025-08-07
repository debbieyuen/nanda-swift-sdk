// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "nanda-swift-sdk",
    platforms: [
            .macOS(.v12)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "nanda-swift-sdk",
            targets: ["nanda-swift-sdk"]),
    ],
    dependencies: [
            .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0")
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "nanda-swift-sdk"),
        .executableTarget(
                    name: "NandaAgentCLI",
                    dependencies: [
                        "nanda-swift-sdk",
                        .product(name: "ArgumentParser", package: "swift-argument-parser")
                    ]
                ),
        .testTarget(
            name: "nanda-swift-sdkTests",
            dependencies: ["nanda-swift-sdk"]
        ),

    ]
)
