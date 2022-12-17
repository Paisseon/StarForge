//
//  Downloader.swift
//  StarForge
//
//  Created by Lilliana on 14/11/2022.
//

import Foundation

struct Downloader {
    // MARK: Internal

    @discardableResult
    static func download(
        _ mods: [Control]
    ) async throws -> [URL] {
        await progress.addTasks(Double(mods.count) * 2.0)
        await progress.setLabel("Downloading \(mods.count) mods")
        
        // Concurrently download all selected mods
        
        let urls: [URL] = try await withThrowingTaskGroup(of: URL.self) { group -> [URL] in
            mods.forEach { mod in
                group.addTask {
                    let dlURL: (URL, _) = try await URLSession.shared.download(from: mod.url)
                    let mvURL: URL = FileHelper.mod.slash(ControlHelper.getID(for: mod) + ".tzst")
                    
                    try await FileHelper.move(from: dlURL.0, to: mvURL)
                    await progress.finishTask()
                    
                    return mvURL
                }
            }
            
            var collected: [URL] = []
            
            for try await value: URL in group {
                collected.append(value)
            }
            
            return collected
        }
        
        if urls.count != mods.count {
            throw StarForgeError.ddlFailed
        }
        
        return urls
    }
    
    static func fetchControls() async throws -> [Control] {
        let (data, _): (Data, URLResponse) = try await URLSession.shared.data(from: URL(string: "https://dl.dropboxusercontent.com/s/1nfa6tsh3x6hi2d/control_k1.json")!)
        let decoder: JSONDecoder = .init()
        let mods: [Control] = try decoder.decode([Control].self, from: data)
        
        return mods
    }

    // MARK: Private

    private static let progress: Progress = .shared
}
