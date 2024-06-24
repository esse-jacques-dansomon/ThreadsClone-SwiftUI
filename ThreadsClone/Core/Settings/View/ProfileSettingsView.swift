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
                                Text("Follow and invite friends")
                                Spacer()
                            }
                        }

                        // Notifications
                        NavigationLink  {

                        } label: {
                            HStack {
                                Image(systemName: "bell")
                                Text("Notifications")
                                Spacer()
                            }
                        }

                        // Saved
                        NavigationLink  {

                        } label: {
                            HStack {
                                Image(systemName: "bookmark")
                                Text("Saved")
                                Spacer()
                            }
                        }

                        // Your likes
                        NavigationLink  {

                        } label: {
                            HStack {
                                Image(systemName: "heart")
                                Text("Your likes")
                                Spacer()
                            }
                        }

                        // Privacy      
                        NavigationLink  {

                        } label: {
                        HStack {
                            Image(systemName: "lock")
                            Text("Privacy")
                            Spacer()
                        }
                        }

                        // Account
                        NavigationLink  {

                        } label: {
                        HStack {
                            Image(systemName: "person")
                            Text("Account")
                            Spacer()
                        }
                        }

                        // Help
                        NavigationLink  {

                        } label: {
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("Help")
                            Spacer()
                        }
                        }


                        // About
                        NavigationLink  {

                        } label: {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("About")
                            Spacer()
                        }
                        }




                    }
                    .foregroundColor(Theme.textColor)
                    .padding()
                    Divider()
                    NavigationLink {

                    }label: {
                        HStack {
                            Text("Switch profiles")
                            Spacer()
                        }.padding()
                    }

                    Button {
                        AuthService.shared.singOut();
                    } label: {
                        HStack {
                            Text("Log out")
                                .foregroundStyle(.red)
                                .bold()
                            
                            Spacer()
                        }.padding()
                    }


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
                            Text("Back")
                        }
                        .foregroundColor(Theme.textColor)

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
