//
//  Control.swift
//  StarForge
//
//  Created by Lilliana on 07/11/2022.
//

import Foundation

struct Control: Codable, Comparable, Hashable {
    let author: String
    let category: Category
    let dependencies: [Int]
    let description: String
    let hasPatch: Bool
    let name: String
    let order: Int
    let removeFiles: [String]
    let tier: Tier
    let url: URL

    static func == (
        lhs: Control,
        rhs: Control
    ) -> Bool {
        lhs.order == rhs.order
    }

    static func < (
        lhs: Control,
        rhs: Control
    ) -> Bool {
        lhs.order < rhs.order
    }

    static func > (
        lhs: Control,
        rhs: Control
    ) -> Bool {
        lhs.order > rhs.order
    }
}
