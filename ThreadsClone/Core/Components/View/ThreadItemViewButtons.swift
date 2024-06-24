//
//  ThreadItemViewButtons.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import SwiftUI


struct ThreadItemViewButtons: View {
    var thread : Thread
    @EnvironmentObject var viewModel: FeedViewModel
    @State var showReplySheet = false

    var body: some View {
        HStack {
                Button {
                    Task {
                        try await viewModel.likeThread(thread: thread)
                    }
                } label: {
                    HStack(alignment: .center, spacing: 3) {
                        Image(systemName: thread.connectedUserHasLiked == true ? "heart.fill" : "heart")
                            .foregroundColor( thread.connectedUserHasLiked == true ? .red : Theme.textColor )

                        Text("\(thread.likes > 0 ? "\(thread.likes)" : "")")
                            .font(.footnote)
                    }
                }
           // }

            Button {
                showReplySheet.toggle()
            } label: {
                HStack(alignment: .center, spacing: 3) {
                    Image(systemName: "bubble.right")
                }
            }

            Button {} label: {
                Image(systemName: "arrow.rectanglepath")
            }


            ShareLink(item: URL(string: "https://www.linkedin.com/in/esse-jacques-dansomon/")!) {
                Image(systemName: "paperplane")
                }
        }
        .foregroundColor(Theme.textColor)
        .sheet(isPresented: $showReplySheet, content: {
                FeedReplyView(thread: thread);
        })
    }
}


struct ThreadItemViewButtons_preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ThreadItemViewButtons(thread: dev.thread)
        }
    }
}
