//
//  FileHelper.swift
//  StarForge
//
//  Created by Lilliana on 07/11/2022.
//

import Foundation
import ZSTD

private let docs: URL = try! FileManager.default.url(
    for: .documentDirectory,
    in: .userDomainMask,
    appropriateFor: nil,
    create: false
)

// MARK: - FileHelper

enum FileHelper {
    // MARK: Internal

    static let app: URL = docs.slash("KOTOR.app")
    static let mod: URL = docs.slash("KOTOR_Mod")
    static let dox: URL = docs

    @inline(__always)
    static func copy(
        from src: URL,
        to dest: URL,
        securely: Bool = true
    ) async throws {
        if securely, access(dest.path, W_OK) == 0 {
            try await remove(at: dest)
        }
        
        try manager.copyItem(at: src, to: dest)
    }
    
    @inline(__always)
    static func ensure() async throws {
        try await makeDirectory(at: app)
        try await makeDirectory(at: mod)
    }
    
    @discardableResult @inlinable
    static func extract(
        from archive: URL
    ) async throws -> URL {
        let tarURL: URL = mod.slash(
            archive
                .lastPathComponent
                .replacingOccurrences(of: "tzst", with: "tar")
        )
        
        let compressed: Data = try .init(contentsOf: archive)
        let inMem: BufferedMemoryStream = .init(startData: compressed)
        let outMem: BufferedMemoryStream = .init()
        
        try ZSTD.decompress(
            reader: inMem,
            writer: outMem,
            config: .default
        )
        
        let decompressed: Data = outMem.representation
        try decompressed.write(to: tarURL)
        
        try await TarHelper.extract(from: tarURL, to: tarURL.deletingLastPathComponent())
        
        try await remove(at: archive)
        try await remove(at: tarURL)
        
        return tarURL.deletingLastPathComponent()
    }
    
    @inlinable
    static func lowercase(
        in directory: URL
    ) async throws {
        let enumerator: FileManager.DirectoryEnumerator? = manager.enumerator(
            at: directory,
            includingPropertiesForKeys: []
        )
        
        guard let enumerator else {
            return
        }
        
        while let file: URL = enumerator.nextObject() as? URL {
            let lower: URL = file.deletingLastPathComponent().slash(file.lastPathComponent.lowercased())
            let underscore: URL = .init(fileURLWithPath: lower.path + "_")
            
            if lower.path != file.path,
               access(file.path, R_OK) == 0
            {
                print("Moving from \(file.path) to \(underscore.path) to \(lower.path)")
                
                try await move(
                    from: file,
                    to: underscore
                )
                
                try await move(
                    from: underscore,
                    to: lower
                )
            }
        }
    }
    
    @inline(__always)
    static func makeDirectory(
        at location: URL
    ) async throws {
        if access(location.path, R_OK) == 0 {
            return
        }
        
        try manager.createDirectory(at: location, withIntermediateDirectories: true)
    }
    
    @inline(__always)
    static func move(
        from src: URL,
        to dest: URL,
        securely: Bool = true
    ) async throws {
        if securely, access(dest.path, W_OK) == 0 {
            try await remove(at: dest)
        }
        
        try manager.moveItem(at: src, to: dest)
    }

    @inline(__always)
    static func remove(
        at location: URL
    ) async throws {
        try manager.removeItem(at: location)
    }
    
    @inlinable
    static func restorePermission() async throws -> URL {
        let data: Data? = UserDefaults.standard.data(forKey: "SecureBookmark")
        
        if let data {
            var isStale: Bool = false
            let url: URL = try .init(resolvingBookmarkData: data, options: .withSecurityScope, bookmarkDataIsStale: &isStale)
            
            if access(url.path, R_OK) != 0 {
                return await Progress.shared.permissionPrompt()
            }
            
            if isStale {
                try await savePermission(for: url)
            }
            
            return url
        } else {
            return await Progress.shared.permissionPrompt()
        }
    }
    
    @inlinable
    static func savePermission(
        for url: URL
    ) async throws {
        let data: Data = try url.bookmarkData(options: .withoutImplicitSecurityScope)
        UserDefaults.standard.set(data, forKey: "SecureBookmark")
    }
    
    @inline(__always)
    static func symlink(
        from file: URL,
        to link: URL,
        securely: Bool = true
    ) async throws {
        if securely, access(link.path, F_OK) == 0 {
            try await remove(at: URL(fileURLWithPath: link.path))
        }
        
        try manager.createSymbolicLink(at: link, withDestinationURL: file)
    }

    // MARK: Private

    private static let manager: FileManager = .default
}
