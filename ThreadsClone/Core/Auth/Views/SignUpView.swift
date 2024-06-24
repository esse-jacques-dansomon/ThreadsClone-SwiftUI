//
//  SignUpView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()

    @Environment(\.dismiss)  var dismiss ;
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    AppLogoView()

                    ThreadsFormFieldView(
                        text: $viewModel.email,
                        title: "Enter your email"
                    ).autocapitalization(.none)

                    ThreadsFormFieldView(
                        text: $viewModel.fullname,
                        title: "Enter your full name"
                    )

                    ThreadsFormFieldView(
                        text: $viewModel.username,
                        title: "Enter your username"
                    )

                    ThreadsFormFieldView(
                        text: $viewModel.password,
                        title: "Enter your password",
                        isSecureField: true
                    )

                    Button {
                        Task {
                             await viewModel.createUser()
                        }
                    } label: {
                        ThreadsTextBtnView(title: "Sign Up")
                            .padding(.vertical)
                    }

                }.padding()

                Spacer()

                Divider()

                Button {
                    dismiss()
                } label: {
                    HStack(alignment: .center) {
                        Text("Have an account?")
                            .foregroundStyle(Theme.textColor)

                        Text("Sign In")
                            .foregroundStyle(Theme.textColor)
                            .underline()
                    }.padding()
                }
            }
        }.alert(item: $viewModel.error  ) 
        { error in
            Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    SignUpView()
}
