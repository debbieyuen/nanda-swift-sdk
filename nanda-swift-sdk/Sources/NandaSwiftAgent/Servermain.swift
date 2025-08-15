//
//  main.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/14/25.
//

import Vapor
import nanda_swift_sdk

struct AgentRequest: Content {
    let message: String?
    let sessionId: String?
    let userId: String?
    let metadata: [String: String]?
}

struct AgentResponse: Content {
    let reply: String
    let data: [String: String]?
}

func routes(_ app: Application) throws {
    app.get("health") { _ in "ok" }

    app.get(".well-known", "agent-facts.json") { req -> Response in
        let path = req.application.directory.workingDirectory + "agent-facts.json"
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            throw Abort(.notFound)
        }
        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "application/ld+json")
        return Response(status: .ok, headers: headers, body: .init(data: data))
    }

    app.post("agent", "respond") { req async throws -> AgentResponse in
        let body = try req.content.decode(AgentRequest.self)

        let baseName = "\(Env.agentPrefix)-core"
        let agentID = MCPUtils.generateAgentID(name: baseName)
        let agent = Agent(name: baseName)
        agent.start()

        let raw = agent.respond(to: body.message ?? "")
        let reply = MCPUtils.formatMessage(agentID: agentID, payload: raw)

        return AgentResponse(reply: reply, data: [
            "impl": "swift-vapor-sdk",
            "agentName": agent.name,
            "agentID": agentID
        ])
    }
}

@main
struct Run {
    static func main() async throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)

        let app = try await Application.make(env)
        app.http.server.configuration.hostname = "0.0.0.0"
        app.http.server.configuration.port =
            Environment.get("PORT").flatMap(Int.init) ?? 8080

        do {
            try routes(app)
            try await app.execute()
        } catch {
            app.logger.report(error: error)
        }

        try await app.asyncShutdown() 
    }
}


