//
//  NavigationBar.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-30.
//

import SwiftUI

struct NavigationBar: View {
    @State var currentview: String
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                NavigationLink(destination: HomeView(), label: {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                })
                Spacer()
                Image(systemName: "plus")
                    .padding(20)
                    .background(.black)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                Spacer()
                NavigationLink(destination: ProfileView(), label: {
                    VStack{
                        Image(systemName: "person")
                        Text("Profile")
                    }
                })
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    NavigationBar(currentview: "home")
}
