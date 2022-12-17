//
//  SetupView.swift
//  StarForge
//
//  Created by Lilliana on 24/11/2022.
//

import SwiftUI
import UniformTypeIdentifiers
import ZIPFoundation

struct SetupView: View {
    // MARK: Internal
    
    @Environment(\.colorScheme) var currentMode

    var body: some View {
        ZStack {
            (currentMode == .dark ? Color.black : Color.white)
                .background(.ultraThickMaterial)
                .opacity(0.75)
            
            VStack {
                Text("Welcome to StarForge!")
                    .font(.title)
                
                Text(isExtracting ? "Extracting .ipa file to work directory, please wait warmly" : "Please select your .ipa file to begin")
                    .font(.subheadline)
                
                if !isExtracting {
                    TaskButtonView(title: "Select IPA", icon: "square.and.arrow.up", task: {
                        Task {
                            isShowingFiles = true
                        }
                    })
                } else {
                    ProgressView()
                }
            }
            .fileImporter(
                isPresented: $isShowingFiles,
                allowedContentTypes: [UTType(filenameExtension: "ipa")!],
                allowsMultipleSelection: false
            ) { result in
                do {
                    isExtracting = true
                    let fileURL: URL = try result.get().first!
                    
                    Task {
                        try FileManager.default.unzipItem(at: fileURL, to: FileHelper.dox)
                        
                        try await FileHelper.move(
                            from: FileHelper.dox.slash("Payload").slash("KOTOR.app"),
                            to: FileHelper.app
                        )
                        
                        try await FileHelper.remove(at: FileHelper.dox.slash("Payload"))
                        try await FileHelper.copy(from: FileHelper.app, to: FileHelper.dox.slash("KOTOR.app.bak"))
                        
                        doneExtracting()
                    }
                } catch {
                    AlertHelper.send(error.localizedDescription, priority: .critical, fatally: true)
                }
            }
        }
        .opacity(didExtract ? 0 : 1)
    }

    // MARK: Private

    @State private var didExtract: Bool = access(FileHelper.app.slash("PkgInfo").path, R_OK) == 0
    @State private var isShowingFiles: Bool = false
    @State private var isExtracting: Bool = false

    private func doneExtracting() {
        didExtract = true
        isExtracting = false
    }
}
