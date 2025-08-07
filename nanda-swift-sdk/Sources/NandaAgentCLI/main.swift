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

struct AgentCLI: ParsableCommand {
    @Option var id: String
    @Option var port: Int
    @Option var apiPort: Int
    @Option var registry: String

    func run() throws {
        guard let url = URL(string: registry) else {
            print("Invalid registry URL")
            return
        }

        let agent = NandaAgent(id: id, port: port, apiPort: apiPort, registryURL: url)
        agent.start()
        agent.register()
        RunLoop.main.run()
    }
}

AgentCLI.main()

