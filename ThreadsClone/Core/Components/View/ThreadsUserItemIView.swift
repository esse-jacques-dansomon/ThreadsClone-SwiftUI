//
//  ThreadsUserItemIView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ThreadsUserItemIView: View {
    let user: User
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var viewModel: CurrentUserProfileViewModel
    @State var openUnfollowSheet = false

    var body: some View {
        HStack(alignment: .center) {
            ThreadsCircleImage(user: user, size: .medium)

            VStack(alignment: .leading) {
                HStack {
                    Text(user.username.trimmingCharacters(in: .whitespacesAndNewlines))
                    Spacer()
                }
                Text(user.fullname.trimmingCharacters(in: .whitespacesAndNewlines))
            }

            Spacer()

            Button {
                Task {
                    if viewModel.isFollowingUser(followedID: user.id) {
                        openUnfollowSheet.toggle()
                    } else {
                        try await viewModel.followerUser(followedUserID: user.id)
                    }
                }
            } label: {
                Text(viewModel.isFollowingUser(followedID: user.id) ? "Following" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .frame(width: 105, height: 32)
                    .cornerRadius(10)
                    .foregroundColor(Theme.textColor)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Theme.textColor , lineWidth: 1)
                    }
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal)
        .sheet(isPresented: $openUnfollowSheet, content: {
            UnfollowSheetView(user: user, openUnfollowSheet: $openUnfollowSheet)
        })
    }
}

struct UserCell_Preview: PreviewProvider {
    static var previews: some View {
        ThreadsUserItemIView(user: dev.user)
            .environmentObject(CurrentUserProfileViewModel())
    }
}
