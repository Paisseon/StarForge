//
//  Progress.swift
//  StarForge
//
//  Created by Lilliana on 16/11/2022.
//

import AppKit
import UniformTypeIdentifiers

@MainActor
final class Progress: ObservableObject {
    // MARK: Lifecycle

    private init() {}

    // MARK: Internal

    static let shared: Progress = .init()

    @Published private(set) var current: Double = 0.0
    @Published private(set) var finished: Double = 0.0
    @Published private(set) var isBusy: Bool = false
    @Published private(set) var label: String = "Girls are preparing, please wait warmly"

    func addTasks(
        _ count: Double
    ) async {
        if count > 0 {
            current += count
        }
    }
    
    func cancelTasks(
        _ count: Double
    ) async {
        if count < current {
            current -= count
        } else {
            current = 0
        }
    }
    
    func clear() async {
        current = 0.0
        finished = 0.0
        await setIsBusy(false)
        await setLabel(nil)
    }
    
    func finishTask() async {
        finished += 1
    }
    
    // This is just put here so I don't need a second @MainActor
    
    func permissionPrompt(
        _ prompt: String = "Pls find drive_c"
    ) async -> URL {
        let panel: NSOpenPanel = .init()
        
        panel.message = prompt
        panel.prompt = "Select"
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        
        let _ = panel.runModal()
        guard let url: URL = panel.urls.first else {
            return FileHelper.dox.slash("blep")
        }
        
        do {
            let data: Data = try url.bookmarkData(options: .withSecurityScope)
            UserDefaults.standard.set(data, forKey: "SecureBookmark")
        } catch {
            AlertHelper.send(error.localizedDescription, priority: .warning)
        }
        
        return url
    }
    
    func showSavePanel() async {
        let savePanel: NSSavePanel = .init()
        
        savePanel.allowedContentTypes = [UTType(filenameExtension: "ipa")!]
        savePanel.canCreateDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.nameFieldStringValue = "KOTOR"
        savePanel.title = "Save KOTOR.ipa"
        savePanel.message = "Choose a location to save"
        
        let response: NSApplication.ModalResponse = savePanel.runModal()
        let url: URL? = response == .OK ? savePanel.url : nil
        
        if let url {
            let ipaURL: URL = FileHelper.dox.slash("KOTOR_Modded.ipa")
            
            Task {
                do {
                    try await FileHelper.move(from: ipaURL, to: url)
                } catch {
                    AlertHelper.send(error.localizedDescription, priority: .warning)
                }
            }
        }
    }
    
    func setIsBusy(
        _ state: Bool
    ) async {
        isBusy = state
    }
    
    func setLabel(
        _ text: String?
    ) async {
        label = (text ?? "Girls are preparing") + ", please wait warmly"
    }
}
