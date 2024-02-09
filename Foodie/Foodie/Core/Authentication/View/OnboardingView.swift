//
//  WelcomeView.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-17.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedPage = 0
    @State private var animation = true
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedPage) {
                VStack {
                    LogoRow()
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.gradientStart, Color.gradientEnd]), startPoint: .bottomLeading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading) {
                            Spacer()
                            Image("Share")
                                .resizable()
                                .frame(width: 350, height: 350)
                            Spacer()
                            Text("Share")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("Foodie allows you to store your food memories without missing a detail. With tons of customizability, your memories will truly be personalized to you.")
                        }
                        .padding()
                        .foregroundStyle(.white)
                    }
                    .frame(height: 600)
                    .cornerRadius(30)
                    .padding()
                }
                .tag(0)
                VStack {
                    LogoRow()
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.gradientStart, Color.gradientEnd]), startPoint: .bottomLeading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading) {
                            Spacer()
                            Image("Discover")
                                .resizable()
                                .frame(width: 350, height: 350)
                            Spacer()
                            Text("COMING SOON")
                                .font(.system(size: 15).smallCaps())
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(3)
                                .background(.gray)
                                .cornerRadius(5)
                            Text("Discover")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("See where and what your friends are eating as they add new restuarants and reviews to their portfolio. With Foodie, you'll never miss out on opportunities.")
                        }
                        .padding()
                        .foregroundStyle(.white)
                    }
                    .frame(height: 600)
                    .cornerRadius(30)
                    .padding()
                }
                .tag(1)
                VStack {
                    LogoRow()
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.gradientStart, Color.gradientEnd]), startPoint: .bottomLeading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading) {
                            Spacer()
                            Image("Privacy")
                                .resizable()
                                .frame(width: 350, height: 350)
                                .frame(maxWidth: .infinity, alignment: .center)
                            Spacer()
                            Text("Privacy")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("We know your privacy always comes first. Any information provided to Foodie is stored on a secured server and all of your data is encrypted.")
                        }
                        .padding()
                        .foregroundStyle(.white)
                    }
                    .frame(height: 600)
                    .cornerRadius(30)
                    .padding()
                }
                .tag(2)
                VStack {
                    Image("FoodieLogo")
                        .resizable()
                        .background(.white)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                        .frame(width: 50, height: 50)
                    Text("Foodie")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text("Ready to Get Started?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    NavigationLink {
                        LoginView()
                    } label: {
                        Image(systemName: "arrow.forward")
                            .foregroundStyle(.white)
                            .padding(20)
                            .background(.green)
                            .clipShape(Circle())
                    }
                }
                .tag(3)
            }
            .onAppear {
                setupAppearance()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .toolbarBackground(.black , for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
    func setupAppearance() {
      UIPageControl.appearance().currentPageIndicatorTintColor = .black
      UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

#Preview {
    OnboardingView()
}
