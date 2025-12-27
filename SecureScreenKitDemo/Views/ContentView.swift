//
//  ContentView.swift
//  SecureScreenKitDemo
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "shield.fill")
                }
                .tag(0)
            
            DemoView()
                .tabItem {
                    Label("Demo", systemImage: "sparkles")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(2)
        }
        .tint(Color.purple)
    }
}

#Preview {
    ContentView()
}
