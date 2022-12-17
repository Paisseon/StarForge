//
//  Recents.swift
//  StarForge
//
//  Created by Lilliana on 25/11/2022.
//

actor Recents {
    private(set) static var installed: [Control] = []

    static func install(
        _ mod: Control
    ) async {
        installed.append(mod)
    }

    static func remove(
        _ mod: Control
    ) async {
        if let index: Int = installed.firstIndex(of: mod) {
            installed.remove(at: index)
        }
    }
    
    static func removeAll() async {
        installed = []
    }
}
