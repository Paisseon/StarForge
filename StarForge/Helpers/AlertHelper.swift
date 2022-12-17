//
//  AlertHelper.swift
//  StarForge
//
//  Created by Lilliana on 07/11/2022.
//

import AppKit
import AVFoundation

@MainActor
enum AlertHelper {
    static func send(
        _ message: String = "Apathy is death.",
        priority: AlertPriority = .info,
        fatally: Bool = false
    ) {
        // Lia making cute alarm sounds 💕
        // If someone has the actual Re:Zero Alarm App for iOS, hmu
        // Willing to pay up to 1000 Emilia pictures
        
        if let audioURL: URL = Bundle.main.url(forResource: "Bibi", withExtension: ".mp3") {
            var audioID: SystemSoundID = 0

            AudioServicesCreateSystemSoundID(audioURL as CFURL, &audioID)
            AudioServicesPlaySystemSound(audioID)
        }
        
        let alert: NSAlert = .init()
        
        alert.alertStyle = .informational
        alert.messageText = "Star Forge"
        alert.informativeText = message
        
        switch priority {
            case .info:
                alert.icon = NSImage(
                    systemSymbolName: "info.circle",
                    accessibilityDescription: "Execution has paused for a non-error"
                )
            case .warning:
                alert.icon = NSImage(
                    systemSymbolName: "exclamationmark.triangle",
                    accessibilityDescription: "A non-critical error has occurred"
                )
            case .critical:
                alert.icon = NSImage(
                    systemSymbolName: "exclamationmark.octagon",
                    accessibilityDescription: "Shit's fucked"
                )
        }
        
        _ = alert.addButton(withTitle: "OK")
        _ = alert.runModal()
        
        // Close the LoadingView if we encounter an error, but .info is fine
        
        if priority != .info {
            Task {
                await Progress.shared.clear()
            }
        }
        
        if fatally {
            fatalError("Your entire party has been killed. Return to main menu.")
        }
    }
}
