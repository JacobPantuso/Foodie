//
//  CustomTabItem.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-30.
//

import SwiftUI

struct CustomTabItem: View {
    var iconName: String
    var label: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: iconName)
                    .font(.system(size: 20))
                    .foregroundColor(.white)

                Text(label)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(width: 60, height: 60)
            .background(Color.black)
            .cornerRadius(30)
            .shadow(radius: 5)
        }
    }
}
