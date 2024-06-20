//
//  ActivityView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ActivityView: View {
    @State var isFixed = false
    @State var selectedTabView = ActivityType.all

    @EnvironmentObject var feedViewModel: FeedViewModel
    @EnvironmentObject var exporeViewMel: ExploreViewModel
    @EnvironmentObject var currentUserProfileViewModel: CurrentUserProfileViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Activity")
                        .font(.title)
                        .bold()
                    Spacer()
                }.padding(.horizontal)
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(ActivityType.allCases, id: \.self) { item in
                            Button {
                                selectedTabView = item

                            } label: {
                                Text(item.title)
                                    .frame(width: 100, height: 40)
                                    .foregroundStyle(selectedTabView.id == item.id ? .white : .black)
                                    .background(selectedTabView.id == item.id ? .black : Color(.systemGray5))
                                    .cornerRadius(9)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .padding(.horizontal, 10)

                ScrollView {
                    switch selectedTabView {
                    case .all:
                        LazyVStack(alignment: .leading) {
                            ForEach(feedViewModel.threads) { thread in
                                ThreadItemView(thread: thread)
                            }
                        }.padding()
                    case .createdThread:
                        LazyVStack(alignment: .leading) {
                            ForEach(currentUserProfileViewModel.threads) { thread in
                                ThreadItemView(thread: thread)
                            }
                        }.padding()
                    case .likedThread:
                        LazyVStack(alignment: .leading) {
                            ForEach(currentUserProfileViewModel.likes) { like in
                              if  let thread = like.thread {
                                  ThreadItemView(thread: thread)
                                }
                            }
                        }.padding()
                    case .repliedThread:
                        LazyVStack(alignment: .leading) {
                            ForEach(currentUserProfileViewModel.replies) { reply in
                                ReplyItemView(reply: reply)
                            }
                        }.padding()
                    case .repostedThread:
                        LazyVStack(alignment: .leading) {
                            ForEach(currentUserProfileViewModel.reposts) { repost in
                                //ThreadItemView(thread: thread)

                            }
                        }.padding()

                    case .followedUser:
                        LazyVStack(alignment: .leading) {
                            ForEach(currentUserProfileViewModel.followings) { follow in

                                if  let user  = follow.followedUser {
                                    ThreadsUserItemIView(user: user)
                                }
                            }
                        }.padding()
                    }
                }

                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack{
        ActivityView()
            .environmentObject(ExploreViewModel())
            .environmentObject(FeedViewModel())
    }

}
