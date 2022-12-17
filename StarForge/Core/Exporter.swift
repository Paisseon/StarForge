//
//  Exporter.swift
//  StarForge
//
//  Created by Lilliana on 26/11/2022.
//

import Foundation

struct Exporter {
    // MARK: Internal

    static func ipa() async throws {
        let payloadURL: URL = FileHelper.dox.slash("Payload")
        let ipaURL: URL = FileHelper.dox.slash("KOTOR_Modded.ipa")
        let tmpAppURL: URL = payloadURL.slash("KOTOR.app")
        
        await progress.setIsBusy(true)
        await progress.setLabel("Building modified .ipa")
        
        // Create a Payload directory and move the app into it
        
        try await FileHelper.makeDirectory(at: payloadURL)
        try await FileHelper.copy(from: FileHelper.app, to: tmpAppURL)
        
        // Remove duplicate dialogue files
        
        try await ["dialog.tlk.bak", "dialogde.tlk", "dialoges.tlk", "dialogfr.tlk", "dialogit.tlk"].asyncForEach { dlg in
            let file: URL = tmpAppURL.slash(dlg)
            
            if access(file.path, W_OK) == 0 {
                try await FileHelper.remove(at: file)
            }
        }
        
        let overrideFiles: [URL] = try FileManager.default.contentsOfDirectory(
            at: tmpAppURL.slash("override"),
            includingPropertiesForKeys: []
        )
        
        let modulesFiles: [URL] = try FileManager.default.contentsOfDirectory(
            at: tmpAppURL.slash("modules"),
            includingPropertiesForKeys: []
        )
        
        // Remove duplicate .tpc files and move all linked files to their respective directories
        // This is safe because the symlinks point to the most recently installed mod!
        
        await withThrowingTaskGroup(of: Void.self) { group in
            await overrideFiles.asyncForEach { file in
                group.addTask {
                    if file.lastPathComponent.hasSuffix(".tpc") {
                        let tga: URL = .init(fileURLWithPath: file.path.dropLast(4).description + ".tga")

                        if access(tga.path, F_OK) == 0 {
                            try await FileHelper.remove(at: file)
                        }
                    }
                    
                    // Ensure that the file both exists (i.e., not deleted above) and is a symlink
                    
                    if access(file.realURL().path, F_OK) == 0,
                       try file.resourceValues(forKeys: [.isSymbolicLinkKey]).isSymbolicLink == true
                    {
                        try await FileHelper.copy(from: file.realURL(), to: file)
                    }
                }
            }
            
            await modulesFiles.asyncForEach { file in
                group.addTask {
                    if try file.resourceValues(forKeys: [.isSymbolicLinkKey]).isSymbolicLink == true {
                        try await FileHelper.copy(from: file.realURL(), to: file)
                    }
                }
            }
        }
        
        // Make all files lowercase since iOS is case-sensitive!
        
        try await ["override", "modules", "streammusic", "streamsounds", "streamwaves"].asyncForEach { dir in
            try await FileHelper.lowercase(in: tmpAppURL.slash(dir))
        }
        
        let overrideSubdirs: [URL] = tmpAppURL.slash("override").subdirectories()
        let modulesSubdirs: [URL] = tmpAppURL.slash("modules").subdirectories()
        
        try await (overrideSubdirs + modulesSubdirs).asyncForEach { dir in
            print(dir.lastPathComponent)
            try await FileHelper.remove(at: dir)
        }
        
        // Zip it up as an .ipa and remove the Payload directory
        
        try FileManager.default.zipItem(at: payloadURL, to: ipaURL)
        try await FileHelper.remove(at: payloadURL)
        
        await progress.showSavePanel()
        await progress.clear()
    }

    // MARK: Private

    private static let progress: Progress = .shared
}
