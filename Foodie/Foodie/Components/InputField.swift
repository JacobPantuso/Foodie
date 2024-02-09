//
//  InputFields.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-18.
//

import SwiftUI

struct InputField: View {
    let imageName: String
    let fieldText: String
    @Binding var text: String
    var isSecureField = false
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .padding(.leading)
            if isSecureField {
                SecureField(fieldText, text: $text)
                    .padding()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            } else {
                TextField(fieldText,
                          text: $text
                )
                .padding()
                .autocapitalization(.none)
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.bottom, 20)
    }
}

#Preview {
    InputField(imageName: "", fieldText: "", text: .constant(""))
}
