//
//  InfoView.swift
//  StarForge
//
//  Created by Lilliana on 23/11/2022.
//

import SwiftUI

struct InfoView: View {
    @StateObject private var progress: Progress = .shared
    
    @Binding var allMods: [Control]
    @Binding var viewing: Control?
    
    var body: some View {
        VStack {
            Text(viewing?.name ?? "")
                .font(.title2)
                .padding()
            
            Text(viewing?.description ?? "")
                .padding([.leading, .trailing])
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Author")
                        .fontWeight(.semibold)
                    Text("Category")
                        .fontWeight(.semibold)
                    Text("Tier")
                        .fontWeight(.semibold)
                    Text("Dependencies")
                        .fontWeight(.semibold)
                    Text("Has Patch")
                        .fontWeight(.semibold)
                }
                .padding([.leading, .trailing, .bottom])
                
                VStack(alignment: .leading) {
                    Text(viewing?.author ?? "")
                    Text(viewing?.category.description ?? "")
                    Text(viewing?.tier.description ?? "")
                    Text(ControlHelper.getNames(for: viewing?.dependencies ?? [], in: allMods).joined(separator: ", "))
                    Text((viewing?.hasPatch ?? false) ? "True" : "False")
                }
                .padding([.trailing, .bottom])
            }
            .padding()
            
            Divider()
            
            VStack {
                TaskButtonView(title: "Download", icon: "icloud.and.arrow.down", task: {
                    Task {
                        do {
                            await progress.setIsBusy(true)
                            let urls: [URL] = try await Downloader.download([viewing!])
                            
                            try await FileHelper.extract(from: urls.first!)
                            await progress.finishTask()
                            
                            await progress.clear()
                        } catch {
                            AlertHelper.send(error.localizedDescription, priority: .warning)
                        }
                    }
                })
                
                (viewing != nil && !Installer.isAlreadyInstalled(viewing!)) ? // If the mod is not installed
                
                TaskButtonView(title: "Install", icon: "square.and.arrow.down", task: {
                    Task {
                        do {
                            await progress.setIsBusy(true)
                            try await Installer.install(viewing!)
                            await progress.clear()
                        } catch {
                            AlertHelper.send(error.localizedDescription, priority: .warning)
                        }
                    }
                })
                
                : // If the mod is installed
                
                TaskButtonView(title: "Remove", icon: "trash", task: {
                    Task {
                        do {
                            await progress.setIsBusy(true)
                            try await Installer.remove(viewing!)
                            await progress.clear()
                        } catch {
                            AlertHelper.send(error.localizedDescription, priority: .warning)
                        }
                    }
                })
            }
        }
    }
}
