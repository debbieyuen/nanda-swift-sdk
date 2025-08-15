import Testing
import Foundation
@testable import nanda_swift_sdk

struct BasicAgentTests {

    // MARK: Agent

    @Test func agent_echoResponds() throws {
        let agent = Agent(name: "UnitAgent")
        agent.start()
        let out = agent.respond(to: "echo hello")
        #expect(out == "hello")
        agent.stop()
    }

    @Test func agent_aboutAndFallback() throws {
        let agent = Agent(name: "UnitAgent")
        #expect(agent.respond(to: "about").contains("UnitAgent"))
        #expect(agent.respond(to: "what is this?").hasPrefix("You said: "))
    }

    @Test func agent_emptyGreets() throws {
        let agent = Agent(name: "UnitAgent")
        let out = agent.respond(to: "   ")
        #expect(out.contains("Hello from UnitAgent"))
    }

    // MARK: MCPUtils

    @Test func mcputils_generatesIDAndFormatsMessage() throws {
        let id = MCPUtils.generateAgentID(name: "Swift Agent")
        #expect(id.contains("swift_agent_"))  // name lowercased + underscore + 8-char suffix
        #expect(id.split(separator: "_").last!.count == 8)

        let msg = MCPUtils.formatMessage(agentID: id, payload: "pong")
        #expect(msg == "[\(id)]: pong")
    }

    @Test func mcputils_parsesRegistryURLFromFile() throws {
        let tmp = FileManager.default.temporaryDirectory.appendingPathComponent("registry_url.txt")
        try "https://example.com/registry".write(to: tmp, atomically: true, encoding: .utf8)

        let urlA = MCPUtils.parseRegistryURL(from: tmp.path)
        #expect(urlA?.absoluteString == "https://example.com/registry")

        let urlB = Registry.loadURL(from: tmp.path)
        #expect(urlB?.absoluteString == "https://example.com/registry")
    }

    // MARK: AgentBridge

    @Test func bridge_requiresConnect() throws {
        let bridge = AgentBridge()
        // receive before connect should report not connected
        #expect(bridge.receive().contains("Not connected"))
    }

    @Test func bridge_connectSendReceiveDisconnect() throws {
        let bridge = AgentBridge()
        bridge.connect(to: URL(string: "https://example.com")!)
        bridge.send(message: "ping")
        let reply = bridge.receive()
        #expect(reply.contains("Received response"))
        bridge.disconnect()
        #expect(bridge.receive().contains("Not connected"))
    }

    // MARK: Env

    @Test func env_defaultsAreStable() throws {
        // These defaults are set when vars are not present
        #expect(Env.agentPrefix == "swift-agent")
        #expect(Env.domainName == "localhost")
        #expect(Env.numAgents == 1)
        // Env.registryURL is nil unless provided
        #expect(Env.registryURL == nil)
    }
}

