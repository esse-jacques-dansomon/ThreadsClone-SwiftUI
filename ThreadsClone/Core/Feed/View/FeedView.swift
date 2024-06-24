//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var viewModel: FeedViewModel
    @EnvironmentObject var currentUserProfileViewModel: CurrentUserProfileViewModel

    var body: some View {
        NavigationStack {
            ScrollView {

                LazyVStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 40, height: 40)
                    ForEach(viewModel.threads) { thread in

                        ThreadItemView(thread: thread, isCurrentUser: thread.user == currentUserProfileViewModel.currentUser )
                    }
                }.padding()
            }
            .safeAreaPadding(.all)
            .scrollIndicators(.hidden)
            .refreshable {
                Task {
                    try await viewModel.fetchThreads()
                }
            }
        }

    }
}


struct FeedView_preview: PreviewProvider {
    static var previews: some View {

        NavigationStack {
            FeedView()
                .environmentObject(FeedViewModel())
        }
    }
}
