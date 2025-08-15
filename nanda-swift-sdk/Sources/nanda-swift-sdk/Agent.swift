// The Swift Programming Language
// https://docs.swift.org/swift-book
// Creating a swift package: https://developer.apple.com/documentation/xcode/creating-a-standalone-swift-package-with-xcode

import Foundation

public class Agent {
    public let name: String
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

    // The brain to call the CLI and HTTP server will both call
    public func respond(to message: String) -> String {
        let text = message.trimmingCharacters(in: .whitespacesAndNewlines)
        if text.isEmpty { return "Hello from \(name)! Try 'echo hello', 'time', or 'about'." }
        if text.lowercased().hasPrefix("echo ") { return String(text.dropFirst(5)) }
        if text.lowercased().contains("time") { return "Server time: \(Date())" }
        if text.lowercased().contains("about") { return "\(name) (Swift SDK) is alive and responding." }
        return "You said: \(text)"
    }
}

