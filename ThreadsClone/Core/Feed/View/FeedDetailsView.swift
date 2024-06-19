//
//  FeedDetails.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import SwiftUI

struct FeedDetailsView: View {
    var thread: Thread
    @EnvironmentObject var viewModel : FeedDetailsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center, spacing: 10) {
                    ThreadsCircleImage(user: thread.user, size: .small)
                    Text(thread.user?.username ?? "")
                    Text(thread.timestamp.timestampString())
                        .foregroundStyle(Color(.systemGray))
                        .font(.caption)
                    Spacer()
                    Button {} label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                    }
                }
                HStack {
                    Text(thread.caption)
                    Spacer()
                }

                ThreadItemViewButtons(thread: thread)

                Divider()
                HStack {
                    Text("Replies")
                    Spacer()
                    Button {

                    }label: {
                        HStack {
                            Text("View Activity")
                            Image(systemName: "chevron.right")
                        }
                        .font(.caption2)
                        .foregroundColor(Color(.systemGray3))
                    }

                }
                Divider()
                LazyVStack {
                    ForEach(viewModel.replies){ reply in
                      ReplyItemView(reply: reply)
                    }
                }
            }.padding()
        }
        .onAppear{
            Task {
                try await viewModel.fetchReplies(threadId: thread.id)
            }
        }
    }
}

struct FeedDetails_preview: PreviewProvider {
    static var previews: some View {
        FeedDetailsView(thread: dev.thread, viewModel: EnvironmentObject<FeedDetailsViewModel>() )
    }
}
