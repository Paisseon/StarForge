//
//  ActionsView.swift
//  StarForge
//
//  Created by Lilliana on 18/11/2022.
//

import SwiftUI

struct ActionsView: View {
    // MARK: Internal

    @Binding var selected: [Control]
    @Binding var allMods: [Control]

    var body: some View {
        Spacer()
        
        VStack {
            TaskButtonView(title: "Download", icon: "icloud.and.arrow.down", task: {
                Task {
                    do {
                        await progress.setIsBusy(true)
                        let urls: [URL] = try await Downloader.download(selected)
                        
                        // Files are compressed to save bandwidth and faster download
                        // Compressed size (download size): 683 MB
                        // Uncompressed size (size on disk): 2 GB
                        
                        try await urls.asyncForEach { url in
                            try await FileHelper.extract(from: url)
                            await progress.finishTask()
                        }
                        
                        await progress.clear()
                    } catch {
                        AlertHelper.send(error.localizedDescription, priority: .warning)
                    }
                }
            })
            
            TaskButtonView(title: "Install", icon: "square.and.arrow.down", task: {
                Task {
                    do {
                        await progress.setIsBusy(true)
                        try await Installer.installMany(selected.filter { !Installer.isAlreadyInstalled($0) }.sorted())
                        await progress.clear()
                        
                        selected = []
                    } catch {
                        AlertHelper.send(error.localizedDescription, priority: .warning)
                    }
                }
            })
            
            TaskButtonView(title: "Generate IPA", icon: "doc.zipper", task: {
                Task {
                    do {
                        try await Exporter.ipa()
                    } catch {
                        AlertHelper.send(error.localizedDescription, priority: .warning)
                    }
                }
            })
            
            // TaskButtonView doesn't work with state-based names and idc enough to fix it
            // @Binding might work, but whatever
            
            Label(title: {
                Text(selected.count < allMods.filter { !Installer.isAlreadyInstalled($0) }.count ? "Select All" : "Select None")
                    .fontWeight(.semibold)
            }, icon: {
                Image(systemName: selected.count < allMods.filter { !Installer.isAlreadyInstalled($0) }.count ? "checkmark.square" : "square")
            })
            .foregroundColor(.white)
            .frame(minWidth: 150, minHeight: 64)
            .background(Color.accentColor.background(.regularMaterial).cornerRadius(18))
            .padding()
            .onTapGesture {
                selected = (selected.count < allMods.filter { !Installer.isAlreadyInstalled($0) }.count) ? allMods.filter { !Installer.isAlreadyInstalled($0) } : []
            }
        }
        
        Spacer()
    }

    // MARK: Private

    private let progress: Progress = .shared
}
