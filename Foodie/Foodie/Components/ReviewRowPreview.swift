//
//  ReviewRow.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-30.
//

import SwiftUI

struct ReviewRowPreview: View {
    @State var name: String
    @State var address: String
    @State var review_dine_again: Bool
    @State var review_description: String
    @State var review_rating: Int
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack(spacing: 10) {
            Text(String(review_rating) + ".0")
                .frame(width: 70, height: 70)
                .fontWeight(.bold)
                .background(Color.green)
                .foregroundStyle(.white)
                .clipShape(Circle())
            VStack(alignment:.leading) {
                HStack {
                    if !review_dine_again {
                        Text(name)
                            .font(.title2)
                            .fontWeight(.bold)
                    } else {
                        Text(name)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("•")
                        Image(systemName: "heart.circle.fill")
                            .imageScale(.medium)
                            .foregroundStyle(.red)
                    }
                }
                Text(address)
                    .font(.subheadline.smallCaps())
                    .foregroundStyle(Color(.systemGray))
                Text(review_description)
                    .font(.subheadline)
                    .lineLimit(2)
                    .truncationMode(.tail)
            }
        }
        .padding(10)
        .background(colorScheme == .dark ? .black : .white )
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: UIScreen.main.bounds.width - 20)
        .padding(5)
    }
}

#Preview {
    ReviewRowPreview(name: "Test Restaurant", address: "48 Front St E, Toronto, ON", review_dine_again: true, review_description: "Lorem ipsum text can be changed. Lorem ipsum text can be changed. Lorem ipsum text can be changed.", review_rating: 4)
}

