//
//  URL+realURL.swift
//  StarForge
//
//  Created by Lilliana on 05/12/2022.
//

import Foundation

// resolvingSymlinksInPath() doesn't actually work, so I had to make this

extension URL {
    func realURL() -> URL {
        do {
            let realPath: String = try FileManager.default.destinationOfSymbolicLink(atPath: self.path)
            return URL.init(fileURLWithPath: realPath)
        } catch {
            return self
        }
    }
}
