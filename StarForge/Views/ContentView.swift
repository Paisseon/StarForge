//
//  ContentView.swift
//  StarForge
//
//  Created by Lilliana on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State var allMods: [Control] = []
    @State var selected: [Control] = []
    @State var viewing: Control?

    var body: some View {
        ZStack {
            HStack {
                ModListView(allMods: $allMods, selected: $selected, viewing: $viewing)
                Divider()
                
                // Show mod info if one is in focus, otherwise show the main 4 buttons

                if viewing != nil {
                    InfoView(allMods: $allMods, viewing: $viewing)
                } else {
                    ActionsView(selected: $selected, allMods: $allMods)
                }
            }

            LoadingView()
            SetupView()
        }
    }
}
