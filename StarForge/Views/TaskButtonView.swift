//
//  TaskButtonView.swift
//  StarForge
//
//  Created by Lilliana on 24/11/2022.
//

import SwiftUI

struct TaskButtonView: View {
    var title: String
    var icon: String
    var task: () -> Void

    var body: some View {
        Label(title: {
            Text(title)
                .fontWeight(.semibold)
        }, icon: {
            Image(systemName: icon)
        })
        .foregroundColor(.white)
        .frame(minWidth: 150.0, minHeight: 64.0)
        .background(
            Color.accentColor
                .background(.regularMaterial)
                .cornerRadius(18.0)
        )
        .padding()
        .onTapGesture(perform: task)
    }
}
