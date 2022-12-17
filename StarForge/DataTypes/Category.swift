//
//  Category.swift
//  StarForge
//
//  Created by Lilliana on 07/11/2022.
//

enum Category: Int, Codable {
    case added = 0
    case bugfix = 1
    case graphics = 2
    case immersion = 3
    case mechanics = 4
    case restore = 5
    case all = 6

    // MARK: Internal

    var description: String {
        switch self {
            case .added:
                return "Added Content"
            case .bugfix:
                return "Bugfix"
            case .graphics:
                return "Graphics"
            case .immersion:
                return "Immersion"
            case .mechanics:
                return "Mechanics"
            case .restore:
                return "Restored Content"
            case .all:
                return "All"
        }
    }
}
