//
//  ThreadItemView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI
import Kingfisher

struct ThreadItemView: View {
    var thread: Thread
    var isCurrentUser: Bool = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    HStack(alignment: .top) {
                        if let user = thread.user  {
                            if( isCurrentUser) {
                                ThreadsCircleImage(user: thread.user)
                            }else {
                                NavigationLink(destination: ProfileView(user: user)) {
                                    ThreadsCircleImage(user: thread.user)
                                }.padding(0)
                            }

                        }else {
                            ThreadsCircleImage(user: thread.user)
                        }

                        VStack (alignment: .leading) {
                            NavigationLink(destination: FeedDetailsView(thread: thread)) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(thread.user?.username ?? "")
                                    Text(thread.caption)
                                        .multilineTextAlignment(.leading)
                                        .font(.footnote)

                                }
                                
                            }

                            .padding(0)
                            .navigationBarTitleDisplayMode(.inline)

                            if let mediaUrls = thread.mediaUrls {
                                ScrollView(.horizontal) {
                                    HStack(spacing: 20) {
                                        ForEach(0 ..< mediaUrls.count, id: \.self) { index in
                                            KFImage(
                                               URL(string: mediaUrls[index]))
                                            .resizable()
                                            .scaledToFill()
                                        }
                                    }
                                }
                                .scrollIndicators(.hidden)
                                .frame(maxHeight: 300)
                                .padding(.bottom)
                            }

                            ThreadItemViewButtons(thread: thread)
                                .padding(.bottom, 5)
                                .foregroundColor(.black)
                        }


                    }


                    Spacer()

                    //
                    HStack {
                        Text(thread.timestamp.timestampString())
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Button {} label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                        }
                    }
                }
                Divider()
            }
        }.padding(.top, 2)
    }
}

struct ThreadItemView_preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ThreadItemView(thread: dev.thread, isCurrentUser: false)

        }
    }
}
