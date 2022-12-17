//
//  Tier.swift
//  StarForge
//
//  Created by Lilliana on 07/11/2022.
//

enum Tier: Int, Codable {
    case essential = 0
    case recommend = 1
    case suggest = 2
    case optional = 3
    case all = 4

    // MARK: Internal

    var description: String {
        switch self {
            case .essential:
                return "Essential"
            case .recommend:
                return "Recommended"
            case .suggest:
                return "Suggested"
            case .optional:
                return "Optional"
            case .all:
                return "All"
        }
    }
}
