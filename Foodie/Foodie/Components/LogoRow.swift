//
//  LogoRow.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-18.
//

import SwiftUI

struct LogoRow: View {
    var body: some View {
        HStack {
            Image("FoodieLogo")
                .resizable()
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: 50, height: 50)
            Text("Foodie")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    LogoRow()
}
