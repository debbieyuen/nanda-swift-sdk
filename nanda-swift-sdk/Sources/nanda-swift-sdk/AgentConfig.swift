//
//  AgentConfig.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/8/25.
//

import Foundation

public struct AgentConfig {
    public let id: String
    public let port: Int
    public let apiPort: Int
    public let registryURL: URL
    public let publicURL: URL?

    public init?() {
        guard
            let id = ProcessInfo.processInfo.environment["AGENT_ID"],
            let portStr = ProcessInfo.processInfo.environment["PORT"],
            let apiPortStr = ProcessInfo.processInfo.environment["API_PORT"],
            let registry = ProcessInfo.processInfo.environment["REGISTRY_URL"],
            let port = Int(portStr),
            let apiPort = Int(apiPortStr),
            let registryURL = URL(string: registry)
        else {
            print("Missing or invalid environment variables.")
            return nil
        }

        let publicURL = ProcessInfo.processInfo.environment["PUBLIC_URL"].flatMap(URL.init(string:))

        self.id = id
        self.port = port
        self.apiPort = apiPort
        self.registryURL = registryURL
        self.publicURL = publicURL
    }
}
