//
//  SettingsView.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-30.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                VStack(alignment: .leading) {
                    Text("Your Account")
                        .font(.headline)
                        .foregroundStyle(.gray)
                    HStack {
                        Image(systemName: "person.fill")
                        VStack(alignment: .leading) {
                            Text("Account Details")
                                .bold()
                            Text("View important information about your account.")
                                .font(.subheadline)
                        }
                        NavigationLink(destination: AccountView(), label: {
                            Image(systemName: "arrow.right.circle")
                                .foregroundStyle(.black)
                        })
                    }
                }
                .frame(minWidth: UIScreen.main.bounds.width)
                .background(.white)
            }
        }
        .navigationTitle("Settings and Privacy")
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SettingsView()
}
