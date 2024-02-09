//
//  FoodieApp.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-17.
//

import SwiftUI
import Firebase

@main
struct FoodieApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
