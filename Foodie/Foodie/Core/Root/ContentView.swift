//
//  ContentView.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-17.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                OnboardingView()
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
