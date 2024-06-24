//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import SwiftUI

struct UserContentListView: View {
    @State var selectedTabView = ProfileThreadsFilter.Threads
    @Namespace var animation;

    var threads: [Thread]
    var replies: [Reply]
    var reposts: [Repost]


    init(user: User,threads: [Thread], replies: [Reply], reposts: [Repost]) {
        self.threads = threads
        self.replies = replies
        self.reposts = reposts
    }


    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadsFilter.allCases) { item in
                    VStack(alignment: .center, spacing: 10) {
                        HStack {
                            Spacer()
                            Text(item.title)
                            Spacer()
                        }.padding(.top)

                        HStack {
                            if selectedTabView == item {
                                Rectangle()
                                    .foregroundColor(Theme.textColor)
                                    .frame(height: 1.5)
                                    .matchedGeometryEffect(id: "ID", in: animation)
                            } else {
                                Rectangle()
                                    .foregroundColor(Color(.systemGray4))
                                    .frame(height: 1)
                            }
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedTabView = item
                        }
                    }
                }
            }

            switch selectedTabView {
            case .Threads:
                LazyVStack {
                    ForEach(threads) { thread in
                        ThreadItemView(thread: thread, isCurrentUser: true)
                    }
                }
            case .Replies:
                if replies.isEmpty {
                    EmptyContentView(text: "No Replies")
                } else {
                    LazyVStack {
                        ForEach(replies) { reply in
                            ReplyItemView(reply: reply)
                        }
                    }
                }

            case .Reposts:
                if reposts.isEmpty {
                    EmptyContentView(text: "No Reposts")
                } else {
                    Text("Reposts")
                }
            }
        }
    }
}

//struct UserContentListView_preview: PreviewProvider {
//    static var previews: some View {
//        //UserContentListView(user: dev.user, isCuurentUser: false)
//    }
//}
