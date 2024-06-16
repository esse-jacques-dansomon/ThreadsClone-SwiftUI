//
//  ProfileSettingsView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import SwiftUI

struct ProfileSettingsView: View {
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 35) {
                        // Follow bar
                        NavigationLink  {

                        } label: {
                            HStack {
                                Image(systemName: "person.badge.plus")
                                    .foregroundColor(.black)
                                Text("Follow and invite friends")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }

                        // Notifications
                        NavigationLink  {

                        } label: {
                            HStack {
                                Image(systemName: "bell")
                                    .foregroundColor(.black)
                                Text("Notifications")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }

                        // Saved
                        NavigationLink  {

                        } label: {
                            HStack {
                                Image(systemName: "bookmark")
                                    .foregroundColor(.black)
                                Text("Saved")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }

                        // Your likes
                        NavigationLink  {

                        } label: {
                            HStack {
                                Image(systemName: "heart")
                                    .foregroundColor(.black)
                                Text("Your likes")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }

                        // Privacy      
                        NavigationLink  {

                        } label: {
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.black)
                            Text("Privacy")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        }

                        // Account
                        NavigationLink  {

                        } label: {
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.black)
                            Text("Account")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        }

                        // Help
                        NavigationLink  {

                        } label: {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.black)
                            Text("Help")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        }


                        // About
                        NavigationLink  {

                        } label: {
                        HStack {
                            Image(systemName: "info.circle")
                                .foregroundColor(.black)
                            Text("About")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        }




                    }.padding()
                    Divider()
                    NavigationLink {

                    }label: {
                        HStack {
                            Text("Switch profiles")
                            Spacer()
                        }.padding()
                    }
                    HStack {
                        Text("Log out")
                            .foregroundStyle(.red)
                            .bold()
                            .onSubmit {
                                AuthService.shared.singOut();
                            }
                        Spacer()
                    }.padding()

                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss();
                    }label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                            Text("Back")
                                .foregroundColor(.black)
                        }
                    }
                }

                ToolbarItem (placement: .topBarTrailing) {
                    Text("Settings").padding(0)
                }
            }
        }
    }
}

#Preview {
    ProfileSettingsView();
}
