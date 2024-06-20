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
            //if let connectedUserHasLiked = thread.connectedUserHasLiked {
                Button {
                    Task {
                        if thread.connectedUserHasLiked != nil && thread.connectedUserHasLiked == true {
                           //try await viewModel.unLikeThread(thread: thread)
                            print("unlike")
                        } else {
                            print("like")
                        }

                        try await viewModel.likeThread(thread: thread)


                    }
                } label: {
                    HStack(alignment: .center, spacing: 3) {
                        Image(systemName: thread.connectedUserHasLiked == true ? "heart.fill" : "heart")
                            .foregroundColor( thread.connectedUserHasLiked == true ? .red : .black )

                        Text("\(thread.likes > 0 ? "\(thread.likes)" : "")")
                            .font(.footnote)
                    }
                }
           // }

            Button {
                showReplySheet.toggle()
                print("Open reply")
            } label: {
                HStack(alignment: .center, spacing: 3) {
                    Image(systemName: "bubble.right")
                }
            }

            Button {} label: {
                Image(systemName: "arrow.rectanglepath")
            }

            Button {} label: {
                Image(systemName: "paperplane")
            }
        }
        .foregroundColor(.black)
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
