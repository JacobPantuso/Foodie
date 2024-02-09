//
//  NewReviewView.swift
//  Foodie
//
//  Created by Jacob Pantuso on 2023-12-30.
//

import SwiftUI

struct NewReviewView: View {
    @State private var confirmDialogVisible = false
    let alertTitle: String = "Discard Post?"
    @Environment(\.dismiss) var dismiss
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
                    Button {
                        confirmDialogVisible = true
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(Color.red)
                    }
                    .alert(
                        alertTitle,
                        isPresented: $confirmDialogVisible
                    ) {
                        Button("Discard", role: .destructive) {
                            dismiss()
                        }
                        Button("Cancel", role: .cancel) {
                            confirmDialogVisible = false
                        }
                    } message: {
                        Text("If you leave this page, your post will be discarded.")
                    }
                }
            }
            .padding()
            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewReviewView()
}
