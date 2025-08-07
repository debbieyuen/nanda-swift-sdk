//
//  MCPUtils.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/8/25.
//


// Sources/NandaSwiftSDK/MCPUtils.swift

import Foundation

public struct MCPUtils {
    
    /// Generates a unique agent ID using the name and a UUID prefix.
    public static func generateAgentID(name: String) -> String {
        let uuid = UUID().uuidString.prefix(8)
        return "\(name.lowercased().replacingOccurrences(of: " ", with: "_"))_\(uuid)"
    }

    /// Formats a message using the agent ID and payload.
    public static func formatMessage(agentID: String, payload: String) -> String {
        return "[\(agentID)]: \(payload)"
    }

    /// Parses a URL from a plain text file path (used for registry_url.txt).
    public static func parseRegistryURL(from filePath: String) -> URL? {
        guard let content = try? String(contentsOfFile: filePath).trimmingCharacters(in: .whitespacesAndNewlines),
              let url = URL(string: content) else {
            print("❌ Failed to parse registry URL from \(filePath)")
            return nil
        }
        return url
    }
}
