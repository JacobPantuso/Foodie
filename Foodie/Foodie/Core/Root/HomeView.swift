//
//  HomeView.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-18.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selection: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 15) {
                    Image("FoodieLogo")
                        .resizable()
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(width: 50, height: 50)
                    Text("Foodie")
                        .font(.title).fontWeight(.bold)
                    Spacer()
                    Menu {
                        NavigationLink (destination: NewReviewView() ,label: {
                            Text("New Review")
                            Image(systemName: "pencil.circle")
                                .imageScale(.large)
                                .foregroundStyle(Color.black)
                        })
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundStyle(Color.black)
                    }
                    Image(systemName: "bell")
                        .imageScale(.large)
                }
                .padding()
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
