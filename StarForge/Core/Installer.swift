//
//  Installer.swift
//  StarForge
//
//  Created by Lilliana on 14/11/2022.
//

import AppKit
import Foundation

struct Installer {
    // MARK: Internal

    static func install(
        _ mod: Control
    ) async throws {
        await progress.setLabel("Installing \(mod.name)")
        await Recents.install(mod)
        
        let path: String = FileHelper.mod.slash(ControlHelper.getID(for: mod)).slash("tslpatchdata").path
        
        if access(path, R_OK) == 0 {
            try await installTSL(mod)
        } else {
            try await installNormal(mod)
        }
        
        await progress.finishTask()
    }
    
    static func installMany(
        _ mods: [Control]
    ) async throws {
        await progress.addTasks(Double(mods.count))
        
        try await mods.asyncForEach { mod in
            try await install(mod)
        }
    }
    
    static func remove(
        _ mod: Control
    ) async throws {
        await Recents.remove(mod)
        
        // Mod with order 0 is Dialogue Improvements, this is installed
        // specially in the root directory so it needs special removal
        
        if mod.order == 0 {
            try await FileHelper.remove(at: FileHelper.app.slash("dialog.tlk"))
            try await FileHelper.move(from: FileHelper.app.slash("dialog.tlk.bak"), to: FileHelper.app.slash("dialog.tlk"))
            
            return
        }
        
        // For everything else, search for symlinks and check if the path contains the mod ID
        // This also removes the mod folder itself, so it's pretty clean
        
        let overrideFiles: [URL] = try FileManager.default.contentsOfDirectory(
            at: FileHelper.app.slash("override"),
            includingPropertiesForKeys: []
        )
        
        try await overrideFiles.asyncForEach { file in
            if file.realURL().path.contains(ControlHelper.getID(for: mod)) {
                try await FileHelper.remove(at: file)
            }
        }
        
        let modulesFiles: [URL] = try FileManager.default.contentsOfDirectory(
            at: FileHelper.app.slash("modules"),
            includingPropertiesForKeys: []
        )
        
        try await modulesFiles.asyncForEach { file in
            if file.realURL().path.contains(ControlHelper.getID(for: mod)) {
                try await FileHelper.remove(at: file)
            }
        }
    }
    
    static func isAlreadyInstalled(
        _ mod: Control
    ) -> Bool {
        if mod.order == 0 {
            return access(FileHelper.app.slash("dialog.tlk.bak").path, R_OK) == 0
        }
        
        let modID: String = ControlHelper.getID(for: mod)
        
        return access(FileHelper.app.slash("override").slash(modID).path, R_OK) == 0 || access(FileHelper.app.slash("modules").slash(modID).path, R_OK) == 0
    }

    // MARK: Private

    private static let progress: Progress = .shared

    // Fuck TSLPatcher, all my homies use... TSLPatcher in CrossOver 😔
    // Basically this function just downloads TSLPatcher.exe if needed,
    // symlinks KOTOR.app for convenience, and copies tslpatchdata
    // then opens TSLPatcher.exe in CrossOver. The rest is just sandbox bs
    
    private static func installTSL(
        _ mod: Control
    ) async throws {
        let url: URL = try await FileHelper.restorePermission()
        
        if url.startAccessingSecurityScopedResource() {
            let tslpURL: URL = url.slash("KOTOR").slash("TSLPatcher.exe")
            let dataURL: URL = url.slash("KOTOR").slash("tslpatchdata")
            
            // This is an older version of TSLPatcher, current version *doesn't work* on all mods
            
            if access(tslpURL.path, W_OK) != 0 {
                await progress.addTasks(1)
                let dlURL: (URL, URLResponse) = try await URLSession.shared.download(from: URL(string: "https://dl.dropboxusercontent.com/s/8z83jvwppkbf89h/TSLPatcher.exe")!)
                await progress.finishTask()
                try await FileHelper.move(from: dlURL.0, to: tslpURL)
            }
            
            try await FileHelper.symlink(
                from: FileHelper.app,
                to: url.slash("Users").slash("crossover").slash("Desktop").slash("KOTOR.app")
            )
            
            try await FileHelper.copy(
                from: FileHelper.mod.slash(ControlHelper.getID(for: mod)).slash("tslpatchdata"),
                to: dataURL
            )
            
            NSWorkspace.shared.open(tslpURL)
            
            await AlertHelper.send("Click OK after you finish installing \(mod.name)")
            try await removeBadFile(from: mod)
            try await FileHelper.makeDirectory(at: FileHelper.app.slash("override").slash(ControlHelper.getID(for: mod)))
            
            url.stopAccessingSecurityScopedResource()
        } else {
            await AlertHelper.send("Security scoping is fucked", priority: .warning)
        }
    }
    
    private static func installNormal(
        _ mod: Control
    ) async throws {
        // Dialogue Improvements goes in @executable_path directory to replace dialog.tlk
        // Save the original to .bak in case the user wants to remove
        
        if mod.order == 0 {
            try await FileHelper.move(
                from: FileHelper.app.slash("dialog.tlk"),
                to: FileHelper.app.slash("dialog.tlk.bak")
            )
            
            try await FileHelper.copy(
                from: FileHelper.mod.slash(ControlHelper.getID(for: mod)).slash("Root").slash("dialog.tlk"),
                to: FileHelper.app.slash("dialog.tlk")
            )
            
            await progress.finishTask()
            
            return
        }
        
        // Copy the mod files to their respective directories and symlink them
        // to the correct URL in the actual directory
        
        let modID: String = ControlHelper.getID(for: mod)
        let modType: String = access(FileHelper.mod.slash(modID).slash("Modules").path, F_OK) == 0 ? "Modules" : "Override"
        let origURL: URL = FileHelper.app.slash(modType.lowercased())
        let hostURL: URL = origURL.slash(modID)
        let patchesURL: URL = FileHelper.mod.slash(modID).slash(modType)
        
        if access(hostURL.path, F_OK) == 0 {
            try await remove(mod)
        }
        
        try await FileHelper.copy(from: patchesURL, to: hostURL)
        
        let files: [URL] = try FileManager.default.contentsOfDirectory(at: hostURL, includingPropertiesForKeys: [])
        
        try await files.asyncForEach { file in
            try await FileHelper.symlink(from: file, to: origURL.slash(file.lastPathComponent))
        }
        
        await progress.finishTask()
    }
    
    private static func removeBadFile(
        from mod: Control
    ) async throws {
        try await mod.removeFiles.asyncForEach { badFile in
            let file: URL = FileHelper.app.slash("override").slash(badFile)
            
            if access(file.path, W_OK) == 0 {
                try await FileHelper.remove(at: file)
            }
        }
    }
}
