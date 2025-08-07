// The Swift Programming Language
// https://docs.swift.org/swift-book
// Creating a swift package: https://developer.apple.com/documentation/xcode/creating-a-standalone-swift-package-with-xcode

import Foundation

public class Agent {
    private let name: String
    private var isRunning: Bool = false

    public init(name: String) {
        self.name = name
    }

    public func start() {
        isRunning = true
        print("🚀 \(name) is now running.")
    }

    public func stop() {
        isRunning = false
        print("🛑 \(name) has stopped.")
    }
}


