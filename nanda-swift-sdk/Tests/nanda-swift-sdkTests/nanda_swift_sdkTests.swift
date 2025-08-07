import Testing
import Foundation
@testable import nanda_swift_sdk

@Test func testAgentInit() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let agent = NandaAgent(
                id: "debbie-test",
                port: 6000,
                apiPort: 6001,
                registryURL: URL(string: "http://localhost:5001")!
            )

            #expect(agent.id == "debbie-test")
            #expect(agent.port == 6000)
            #expect(agent.apiPort == 6001)
            #expect(agent.registryURL.absoluteString == "http://localhost:5001")
}
