//
//  SignUpView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var username: String = ""
    @State var fullname: String = ""
    @State var password: String = ""
    
    @Environment(\.dismiss)  var dismiss ;
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    AppLogoView()

                    ThreadsFormFieldView(
                        text: $email,
                        title: "Enter your email"
                    ).autocapitalization(.none)

                    ThreadsFormFieldView(
                        text: $fullname,
                        title: "Enter your full name"
                    )

                    ThreadsFormFieldView(
                        text: $username,
                        title: "Enter your usernam"
                    )

                    ThreadsFormFieldView(
                        text: $password,
                        title: "Enter your password",
                        isSecureField: true
                    )

                    Button {
                       
                    } label: {
                        ThreadsextBtnView(title: "Sign Up")
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
                            .foregroundStyle(.black)

                        Text("Sign In")
                            .foregroundStyle(.black)
                            .underline()
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
