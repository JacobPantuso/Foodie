//
//  MainTabView.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-30.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection = 2
    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "sparkle.magnifyingglass")
                }
                .tag(1)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
}
