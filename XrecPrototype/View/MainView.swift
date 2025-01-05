//
//  MainView.swift
//  XrecPrototype
//
//  Created by Majirefy on 2025/1/5.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Analyse", systemImage: "chart.dots.scatter", value: "Analyse") {
                Text("Analyse")
            }
            Tab("Home", systemImage: "heart.rectangle", value: "Home") {
                HomeView()
            }
            Tab("Preferences", systemImage: "gear", value: "Preferences") {
                Text("Preferences")
            }
        }
    }
}

#Preview {
    MainView()
}
