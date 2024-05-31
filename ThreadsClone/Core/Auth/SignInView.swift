//
//  SignInView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    AppLogoView()
                        
                    ThreadsFormFieldView(
                        text: $email,
                        title: "Enter your email"
                    )
                        
                    ThreadsFormFieldView(
                        text: $password,
                        title: "Enter your password",
                        isSecureField: true
                    )
                      
                    NavigationLink {
                        ForgotPasswordView()
                    } label: {
                        Text("Forget Password")
                            .foregroundStyle(.black)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                            
                    Button {} label: {
                        ThreadsextBtnView(title: "Login")
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
                            .foregroundStyle(.black)

                        Text("Sign Up")
                            .foregroundStyle(.black)
                            .underline()
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    SignInView()
}
