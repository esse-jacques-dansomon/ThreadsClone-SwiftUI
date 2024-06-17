//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User

//    @StateObject var viewModel  =  ProfileViewModel(user: user);

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                // User and Menu
                ProfileHeaderView(user: user)

                ThreadsTextBtnView(title: "Follow")
                    .foregroundColor(.blue)
            }

            // Custom TabView
            UserContentListView(user: user)
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .scrollIndicators(.hidden)
    }
}

struct ProfileView_preview: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
