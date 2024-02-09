//
//  LoginView.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-17.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isCorrect = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack() {
                Spacer()
                    .frame(height: 150)
                Image("FoodieLogo")
                    .resizable()
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(width: 100, height: 100)
                VStack() {
                    Text("Login")
                        .font(.system(size: 40)).bold()
                    Text(isCorrect ? "The information provided is incorrect." : "Enter your login details below.")
                        .foregroundStyle(isCorrect ? Color.red : Color.black)
                    Spacer()
                        .frame(height: 30)
                    InputField(imageName: "person.fill", fieldText: "Email Address", text: $email)
                    InputField(imageName: "lock.shield", fieldText: "Password", text: $password, isSecureField: true)
                }
                Button {
                    Task {
                        do {
                            try await viewModel.signIn(withEmail: email, password: password)
                        } catch {
                            isCorrect = true
                        }
                    }
                    } label: {
                        HStack {
                            Text("Login")
                            Image(systemName: "arrow.forward.circle")
                        }
                        .frame(width: 150, height: 48)
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1.0 : 0.5)
                        .foregroundColor(.white)
                    }
                    .background(Color.green)
                .cornerRadius(10)
                Spacer()
                NavigationLink {
                    SignupView()
                } label: {
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .bold()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 50)
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
