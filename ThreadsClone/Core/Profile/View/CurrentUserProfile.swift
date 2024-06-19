//
//  CurrentUserProfile.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import SwiftUI

struct CurrentUserProfile: View {
    @State var showEditView = false;
    @StateObject var viewModel = CurrentUserProfileViewModel()

    private var currentUser: User? {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Buttons
                    HStack {
                        Image(systemName: "globe")
                            .font(.title)
                        Spacer()
                        HStack {
                            Image("instagram")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)

                            NavigationLink {
                                ProfileSettingsView()
                                    .navigationBarBackButtonHidden()

                            } label: {
                                Image("menu")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }.padding(.bottom)

                    // User and Menu
                    if let user = currentUser {
                        VStack(alignment: .leading, spacing: 12) {
                            // User and Menu
                            ProfileHeaderView(user: user)
                        }
                    }

                    HStack {

                        Button(action: {
                            showEditView.toggle()
                        }, label: {
                            ThreadsTextBtnView(title: "Edit Profile", textColor: .black, background: .white)

                        })



                        ThreadsTextBtnView(title: "Share Profile",
                                           textColor: .black, background: .white)
                    }

                    // Custom TabView
                    if let user = currentUser {
                        UserContentListView(user: user, isCuurentUser: true)
                    }


                }
            }.sheet(isPresented: $showEditView, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }else {
                    Text("No User found")
                }
            })
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}

#Preview {
    CurrentUserProfile()
}
