//
//  URL+subdirectories.swift
//  StarForge
//
//  Created by Lilliana on 05/12/2022.
//

import Foundation

// Used in Exporter to remove all mod folders (shrinks the resultant .ipa by up to 2GB!)

extension URL {
    func subdirectories() -> [URL] {
        guard hasDirectoryPath else {
            return []
        }
        
        do {
            return try FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]).filter(\.hasDirectoryPath)
        } catch {
            return []
        }
    }
}
