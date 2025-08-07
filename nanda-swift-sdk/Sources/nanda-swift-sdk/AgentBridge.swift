//
//  AgentBridge.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/8/25.
//

// Sources/NandaSwiftSDK/AgentBridge.swift

import Foundation

public class AgentBridge {
    private var connected = false

    public init() {}

    /// Connects the agent bridge to a given endpoint (URL).
    public func connect(to endpoint: URL) {
        connected = true
        print("🌉 AgentBridge connected to \(endpoint.absoluteString)")
    }

    /// Sends a message to the bridge if connected.
    public func send(message: String) {
        guard connected else {
            print("⚠️ Cannot send message — not connected")
            return
        }
        print("📤 AgentBridge sent message: '\(message)'")
    }

    /// Receives a mock response from the bridge if connected.
    public func receive() -> String {
        guard connected else {
            return "⚠️ Not connected — no message received"
        }
        // Stubbed response
        return "📨 Received response from bridge"
    }

    /// Disconnects the bridge.
    public func disconnect() {
        connected = false
        print("🔌 AgentBridge disconnected")
    }
}
