// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "nanda-swift-sdk",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "nanda-swift-sdk",
            targets: ["nanda-swift-sdk"]
        ),
        .executable(
            name: "NandaAgentCLI",
            targets: ["NandaAgentCLI"]
        )
    ],
    dependencies: [
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
        .testTarget(
            name: "nanda-swift-sdkTests",
            dependencies: [
                "nanda-swift-sdk"
            ]
        )
    ]
)
