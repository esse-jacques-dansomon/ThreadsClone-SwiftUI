//
//  SignInView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct SignInView: View {

    @StateObject var viewModel  = SignInViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    AppLogoView()
                        
                    ThreadsFormFieldView(
                        text: $viewModel.email,
                        title: "Enter your email"
                    )
                        
                    ThreadsFormFieldView(
                        text: $viewModel.password,
                        title: "Enter your password",
                        isSecureField: true
                    )
                      
                    NavigationLink {
                        ForgotPasswordView()
                    } label: {
                        Text("Forget Password")
                            .foregroundStyle(Theme.textColor)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                            
                    Button {
                        Task {
                             await viewModel.login();
                        }
                    } label: {
                        ThreadsTextBtnView(title: "Login")
                            .padding(.vertical)
                    }
                
                }.padding()
                Spacer()
                
                Divider()
                
                NavigationLink {
                    SignUpView()
                        .navigationBarBackButtonHidden(true)
                        
                } label: {
                    HStack(alignment: .center) {
                        Text("Don't have an account?")
                            .foregroundStyle(Theme.textColor)

                        Text("Sign Up")
                            .foregroundStyle(Theme.textColor)
                            .bold()
                        
                    }.padding()
                }
            }.alert(item: $viewModel.error  )
            { error in
                Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
            }
        }
        .background(Theme.backgroundColor)
    }
}

#Preview {
    SignInView()
}
