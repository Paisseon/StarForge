//
//  URL+slash.swift
//  StarForge
//
//  Created by Lilliana on 25/11/2022.
//

import Foundation

// Just to shorten some code

extension URL {
    func slash(
        _ nextPath: String
    ) -> URL {
        self.appendingPathComponent(nextPath)
    }
}
