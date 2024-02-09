//
//  Profile View.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-18.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
         NavigationStack {
            VStack(spacing:20) {
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
                    NavigationLink(destination: SettingsView(), label: {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .foregroundStyle(colorScheme == .dark ? .white : .black )
                    })
                }
                .padding(.bottom)
                HStack {
                    Text(User.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(User.MOCK_USER.fullName)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(User.MOCK_USER.username)
                            .font(.subheadline)
                            .foregroundStyle(Color(.systemGray2))
                            .padding(.bottom, 5)
                        HStack {
                            Text("\(User.MOCK_USER.followers.count)")
                            Text("Followers")
                                .fontWeight(.bold)
                            Text("\(User.MOCK_USER.following.count)")
                            Text("Following")
                                .fontWeight(.bold)
                        }
                    }
                    Spacer()
                    Image(systemName: "square.and.pencil.circle.fill")
                        .imageScale(.large)
                }
                Text("Your Portfolio")
                    .font(.title3.smallCaps())
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.systemGray))
                VStack(spacing: 13) {
                    ForEach(User.MOCK_USER.reviews) { review in
                        ReviewRowPreview(name: review.place_name, address: review.place_location, review_dine_again: review.review_dine_again, review_description: review.review_description, review_rating: review.review_rating)
                    }
                }
                Spacer()
            }
            .padding(.trailing)
            .padding(.leading)
        }
    }
}

#Preview {
    ProfileView()
}
