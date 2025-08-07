//
//  main.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/8/25.
//  Resources: https://www.swift.org/getting-started/cli-swiftpm/
//

import Foundation
import ArgumentParser
import nanda_swift_sdk


let agentID = MCPUtils.generateAgentID(name: Env.agentPrefix)
print("🆔 Agent ID: \(agentID)")
print("🌍 Domain: \(Env.domainName)")
print("🔢 Num Agents: \(Env.numAgents)")

guard let registry = Env.registryURL else {
    print("❌ Missing REGISTRY_URL")
    exit(1)
}

let message = MCPUtils.formatMessage(agentID: agentID, payload: "Hello from Swift Agent")

let bridge = AgentBridge()
bridge.connect(to: registry)
bridge.send(message: message)
print(bridge.receive())
bridge.disconnect()



