//
//  Tool.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/8/25.
//

import Foundation

public class AgentRunner {
    private var agents: [Agent] = []

    public init() {
        // Initialize with mock agents
        agents = [
            Agent(name: "UI Agent"),
            Agent(name: "Bridge Agent")
        ]
    }

    public func startAllAgents() {
        print("Starting agents...\n")

        for agent in agents {
            agent.start()
        }

        print("\n All agents started.")
    }
}
