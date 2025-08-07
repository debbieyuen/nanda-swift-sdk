// The Swift Programming Language
// https://docs.swift.org/swift-book
// Creating a swift package: https://developer.apple.com/documentation/xcode/creating-a-standalone-swift-package-with-xcode

import Foundation

public struct NandaAgent {
    public let id: String
        public let port: Int
        public let apiPort: Int
        public let registryURL: URL
        public let publicURL: URL?
        
        public init(id: String, port: Int, apiPort: Int, registryURL: URL, publicURL: URL? = nil) {
            self.id = id
            self.port = port
            self.apiPort = apiPort
            self.registryURL = registryURL
            self.publicURL = publicURL
        }

    public func start() {
        print("Agent \(id) starting on port \(port)")
        print("Will register with: \(registryURL)")
    }
}
