//
//  StarForgeApp.swift
//  StarForge
//
//  Created by Lilliana on 06/11/2022.
//

import SwiftUI

@main
struct StarForgeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        #if os(macOS)
        Settings {
            PreferencesView()
        }
        #endif
    }
}
