//
//  PreferencesView.swift
//  StarForge
//
//  Created by Lilliana on 30/11/2022.
//

import SwiftUI
 
struct PreferencesView: View {
    private let progress: Progress = .shared
    
    var body: some View {
        TabView {
            Group {
                VStack {
                    Text("She has brought truth, and you condemn it? The ") + Text("arrogance!").italic()
                    
                    // Removes the current working .app directory and replaces it with a copy of the original .ipa
                    // This is the *only* way to get a truly clean mod removal
                    
                    Button("Uninstall All Mods") {
                        Task {
                            await progress.setLabel("Uninstalling all mods")
                            await progress.setIsBusy(true)
                            
                            try await FileHelper.copy(
                                from: FileHelper.dox.slash("KOTOR.app.bak"),
                                to: FileHelper.app
                            )
                            
                            await Recents.removeAll()
                            await progress.clear()
                        }
                    }
                    .padding()
                    
                    // This only applies on the next time app opens
                    
                    Button("Reload Mod List") {
                        Task {
                            UserDefaults.standard.set(Date(timeIntervalSinceNow: -0x15181), forKey: "ReloadDate")
                        }
                    }
                    .padding()
                    
                    // Removes all StarForge files, except the app itself
                    // Basically only run this if you're about to uninstall
                    
                    Button("Clear Cached Files") {
                        Task {
                            await progress.setLabel("Clearing cached files")
                            await progress.setIsBusy(true)
                            
                            try await FileHelper.remove(at: FileHelper.dox)
                            try await FileHelper.makeDirectory(at: FileHelper.dox)
                            
                            await Recents.removeAll()
                            await progress.clear()
                        }
                    }
                    .padding()
                }
            }
            .tabItem {
                Label("Preferences", systemImage: "gearshape")
            }
        }
        .frame(width: 500, height: 280)
    }
}
