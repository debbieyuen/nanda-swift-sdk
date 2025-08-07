//
//  Registry.swift
//  nanda-swift-sdk
//
//  Created by Debbie Yuen on 8/8/25.
//

import Foundation

public class Registry {
    public static func loadURL(from path: String) -> URL? {
        guard let content = try? String(contentsOfFile: path).trimmingCharacters(in: .whitespacesAndNewlines),
              let url = URL(string: content) else {
            return nil
        }
        return url
    }
}

