//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @EnvironmentObject var viewModel: CurrentUserProfileViewModel
    @State var openUnfollowSheet = false
    @StateObject var profileViewModel : ProfileViewModel

    init(user: User) {
        self.user = user
        _profileViewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    // User and Menu
                    ProfileHeaderView(user: user)

                    Button {
                        if viewModel.isFollowingUser(followedID: user.id) {
                            openUnfollowSheet.toggle()
                        }else {
                            Task {
                               try await viewModel.followerUser(followedUserID: user.id)
                            }
                        }
                    } label: {
                        ThreadsTextBtnView(
                            title: viewModel.isFollowingUser(followedID: user.id) ? "Unfollow": "Follow",
                            textColor:  viewModel.isFollowingUser(followedID: user.id) ? .black : .white,
                            background:  viewModel.isFollowingUser(followedID: user.id) ? Color(.systemGray3) : .black
                        );
                    }
                }

                // Custom TabView
                UserContentListView(
                    user: user,
                    threads: profileViewModel.threads,
                    replies: profileViewModel.replies,
                    reposts: profileViewModel.reposts

                )
            }
            .padding(.horizontal)
            .scrollIndicators(.hidden)
        } .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $openUnfollowSheet, content: {
                UnfollowSheetView(user: user, openUnfollowSheet: $openUnfollowSheet)
            })


    }
}

struct ProfileView_preview: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
            .environmentObject(ExploreViewModel())
    }
}
