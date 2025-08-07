//
//  AgentRegistration.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/8/25.
//

import Foundation

extension NandaAgent {
    public func register() {
        let url = registryURL.appendingPathComponent("register")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        request.httpBody = try? encoder.encode(self)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Registration failed: \(error)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Registration status: \(httpResponse.statusCode)")
            }
        }

        task.resume()
    }
}
