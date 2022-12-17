//
//  LoadingView.swift
//  StarForge
//
//  Created by Lilliana on 23/11/2022.
//

import SwiftUI

struct LoadingView: View {
    // MARK: Internal

    @Environment(\.colorScheme) var currentMode

    var body: some View {
        if progress.isBusy {
            (currentMode == .dark ? Color.black : Color.white).background(.regularMaterial).opacity(0.75)

            VStack {
                if progress.current > 0 {
                    ProgressView(value: min(max(progress.finished / progress.current, 0.0), 1.0))
                        .frame(width: barWidth)
                } else {
                    ProgressView()
                }

                Text(progress.label)
                    .padding()
            }
        }
    }

    // MARK: Private

    @StateObject private var progress: Progress = .shared
    private let barWidth: Double = (NSScreen.main?.frame.width ?? 1250) / 5
}
