//
//  UnfollowSheetView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 19/06/2024.
//

import SwiftUI

struct UnfollowSheetView: View {
    let user: User
    @Binding var openUnfollowSheet : Bool
    @EnvironmentObject var viewModel: CurrentUserProfileViewModel

    var body: some View {
        ZStack {
            Theme.backgroundColor
                .edgesIgnoringSafeArea([.bottom, .horizontal])

            VStack(alignment: .center) {
                VStack {
                    ThreadsCircleImage(user: user, size: .large)
                    HStack {
                        Text("Unfollow")
                        Text("\(user.username)").bold()
                        Text("?")
                    }.foregroundStyle(Theme.textColor).padding(.bottom)

                    Divider()
                    Button {
                        Task {
                            try await viewModel.unFollowerUser(followedUid: user.id)
                            openUnfollowSheet.toggle()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("Unfollow")
                                .foregroundStyle(.red)
                            Spacer()

                        }.padding()
                    }
                    Divider()

                    Button {
                        openUnfollowSheet.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Cancel")
                                .foregroundStyle(Theme.textColor)
                            Spacer()
                        }.padding(.top)
                    }
                }
            }
            .presentationDetents([.height(250)])
        }
    }
}

struct UnfollowSheetView_Preview: PreviewProvider {
    static var previews: some View {
        UnfollowSheetView(user: dev.user, openUnfollowSheet: .constant(false))
            .environmentObject(CurrentUserProfileViewModel())
    }
}
