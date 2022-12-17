//
//  ModListView.swift
//  StarForge
//
//  Created by Lilliana on 18/11/2022.
//

import SwiftUI

struct ModListView: View {
    @AppStorage("CachedMods") private var cachedMods: Data = .init()
    
    @StateObject private var progress: Progress = .shared
    @StateObject private var observer: TextFieldObserver = .init(delay: .seconds(0.25))
    
    @State private var category: Category = .all
    @State private var tier: Tier = .all
    
    @Binding var allMods: [Control]
    @Binding var selected: [Control]
    @Binding var viewing: Control?
    
    private let categories: [Category] = [.all, .added, .bugfix, .graphics, .immersion, .mechanics, .restore]
    private let tiers: [Tier] = [.all, .optional, .suggest, .recommend, .essential]
    private let barWidth: Double = (NSScreen.main?.frame.width ?? 1250) / 5
    
    // Only show the mods which meet user's specified criteria
    
    private func isValid(
        _ mod: Control
    ) -> Bool {
        (observer.debouncedText.isEmpty || mod.name.lowercased().contains(observer.debouncedText.lowercased())) &&
            (category == .all || mod.category == category) &&
            (tier == .all || mod.tier == tier)
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $observer.searchText)
                .padding([.top, .leading, .trailing])
            
            HStack {
                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) {
                        Text($0.description)
                    }
                }
                .pickerStyle(.menu)
                
                Picker("Tier", selection: $tier) {
                    ForEach(tiers, id: \.self) {
                        Text($0.description)
                    }
                }
                .pickerStyle(.menu)
            }
            .padding()
            
            List(allMods.filter { isValid($0) }.sorted(), id: \.self) { mod in
                ZStack(alignment: .leading) {
                    Color.gray
                        .opacity(viewing == mod ? 0.25 : 0)
                    
                    HStack {
                        CheckboxView(mod: mod, selected: $selected, allMods: $allMods)
                        Text(mod.name)
                    }
                    .frame(height: 20)
                    .onTapGesture {
                        viewing = (viewing == mod) ? nil : mod
                    }
                }
            }
            .padding([.leading, .trailing, .bottom])
            .task {
                // Check for cached mods, then load them to the view
                // If mods aren't cached, download the control from DB
                // If they are, check for updates in the background
                
                do {
                    let reloadDate: Date = .init(timeIntervalSince1970: UserDefaults.standard.double(forKey: "ReloadDate"))
                    
                    if let cached: [Control] = try? JSONDecoder().decode([Control].self, from: cachedMods),
                       reloadDate.distance(to: .now) <= 0x15180
                    {
                        allMods = cached
                    } else {
                        await progress.setIsBusy(true)
                        
                        try await FileHelper.ensure()
                        allMods = try await Downloader.fetchControls()
                        cachedMods = try JSONEncoder().encode(allMods)
                        UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: "ReloadDate")
                        
                        await progress.clear()
                    }
                } catch {
                    AlertHelper.send("\(error)", priority: .critical)
                }
                
                // await RepoBuilder.main()
            }
        }
        .frame(minWidth: barWidth)
    }
}
