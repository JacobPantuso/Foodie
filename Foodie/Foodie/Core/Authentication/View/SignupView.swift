//
//  SignupView.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-17.
//

import SwiftUI

struct SignupView: View {
    @State private var fullName = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var exists = false
    @FocusState private var isUsernameFocused: Bool
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack() {
            Spacer()
            Image("FoodieLogo")
            Text("Sign Up")
                .bold()
                .font(.system(size: 33))
            Text("Discover. Share. Savour.")
            Spacer()
            VStack {
                ZStack(alignment: .trailing) {
                    InputField(imageName: "at.circle.fill", fieldText: "Username", text: $username)
                        .textInputAutocapitalization(.never)
                        .focused($isUsernameFocused)
                        .onChange(of: isUsernameFocused, initial: false) {
                            if !isUsernameFocused {
                                Task {
                                    do {
                                        exists = try await viewModel.userExist(username: username)
                                        if exists {
                                            print("DEBUG: Username exists!")
                                        } else {
                                            print("DEBUG: Username does not exist!")
                                        }
                                    } catch {
                                        print("DEBUG: Username exists!")
                                    }
                                }
                            }
                        }
                    if !exists {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                            .padding(.bottom)
                            .padding(.trailing)
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                            .padding(.bottom)
                            .padding(.trailing)
                    }
                }
                InputField(imageName: "envelope.fill", fieldText: "Email Address", text: $email)
                InputField(imageName: "lock.circle", fieldText: "Password", text: $password, isSecureField: true)
                ZStack(alignment: .trailing) {
                    InputField(imageName: "lock.circle.fill", fieldText: "Confirm Password", text: $confirmPassword, isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                                .padding(.bottom)
                                .padding(.trailing)
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                                .padding(.bottom)
                                .padding(.trailing)
                        }
                    }
                }

            }
            .frame(width: UIScreen.main.bounds.width - 50)
            Button {
                Task {
                    try await viewModel.createAccount(withUsername:username, 
                                                      fullName: fullName,
                                                      email: email,
                                                      password: password)
                }
            } label: {
                HStack {
                    Text("Sign Up")
                    Image(systemName: "arrow.forward.circle")
                }
                .frame(width: UIScreen.main.bounds.width - 100, height: 48)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .foregroundColor(.white)
            }
            .background(Color.green)
            .cornerRadius(10)
            Spacer()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 5) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .bold()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension SignupView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !exists
    }
}

#Preview {
    SignupView()
}
