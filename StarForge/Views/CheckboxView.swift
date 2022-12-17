//
//  CheckboxView.swift
//  StarForge
//
//  Created by Lilliana on 23/11/2022.
//

import SwiftUI

struct CheckboxView: View {
    @StateObject private var progress: Progress = .shared
    
    @State var mod: Control
    @Binding var selected: [Control]
    @Binding var allMods: [Control]
    
    private func add() {
        // Ensure that we have all dependencies selected unless they are installed already
        
        ControlHelper.getControls(for: mod.dependencies, in: allMods).forEach { dependency in
            if !selected.contains(dependency), !Installer.isAlreadyInstalled(dependency) {
                selected.append(dependency)
            }
        }
        
        // Patches must come after their original mod, so if the user was dumb and installed it on its own, overwrite that
        
        if mod.hasPatch {
            let patch: Control = ControlHelper.getControls(for: [mod.order + 1], in: allMods).first!
            
            if !selected.contains(patch) {
                selected.append(patch)
            }
        }
        
        selected.append(mod)
    }
    
    private func remove() {
        // Patches shouldn't be installed without their original mod
        // Also, they will always be the next mod, so getting by order + 1 works
        
        if mod.hasPatch,
           let patch: Control = ControlHelper.getControls(for: [mod.order + 1], in: allMods).first,
           let patchIndex: Int = selected.firstIndex(of: patch)
        {
            selected.remove(at: patchIndex)
        }
        
        if let index: Int = selected.firstIndex(of: mod) {
            selected.remove(at: index)
        }
    }
    
    private func toggle() {
        selected.contains(mod) ? remove() : add()
    }
    
    var body: some View {
        Button(action: toggle) {
            Image(systemName: selected.contains(mod) ? "checkmark.square" : "square")
        }
        .buttonStyle(.borderless)
        .disabled(Installer.isAlreadyInstalled(mod))
    }
}
