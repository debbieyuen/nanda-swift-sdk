//
//  Env.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/8/25.
//


import Foundation

public struct Env {
    public static let agentPrefix = ProcessInfo.processInfo.environment["AGENT_ID_PREFIX"] ?? "swift-agent"
    public static let domainName = ProcessInfo.processInfo.environment["DOMAIN_NAME"] ?? "localhost"
    public static let registryURL = ProcessInfo.processInfo.environment["REGISTRY_URL"].flatMap(URL.init(string:))
    public static let numAgents = Int(ProcessInfo.processInfo.environment["NUM_AGENTS"] ?? "1") ?? 1
}
