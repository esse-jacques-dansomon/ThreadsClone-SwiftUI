//
//  FeedReplyView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 19/06/2024.
//

import SwiftUI
import Kingfisher

struct FeedReplyView: View {
    var thread: Thread
    @State var replyCaption = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : FeedDetailsViewModel

    private var user: User? {
        return UserService.shared.currentUser
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        ThreadsCircleImage(user: thread.user)

                        VStack(alignment: .leading, spacing: 5) {
                            Text(thread.user?.username ?? "")

                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                                .font(.footnote)
                        }                                .foregroundColor(Theme.textColor)



                        Spacer()

                    }.padding()
                    if let mediaUrls = thread.mediaUrls {
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(0 ..< mediaUrls.count, id: \.self) { index in
                                    KFImage(
                                       URL(string: mediaUrls[index]))
                                    .resizable()
                                    .scaledToFit()

                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        .frame(maxHeight: 250)
                        .padding(.horizontal)
                    }

                    Divider()

                    HStack(alignment: .top) {
                        ThreadsCircleImage(user: user)
                        VStack {
                            HStack {
                                Text(user?.fullname ?? "")
                                Spacer()
                            }
                            TextField("Reply to \(thread.user?.username ?? "")", text: $replyCaption, axis: .vertical)
                                .multilineTextAlignment(.leading)
                        }
                        .foregroundColor(Theme.textColor)


                    }.padding()
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            Task {
                               try await  viewModel.replyThread(thread: thread, caption: replyCaption)
                                dismiss()
                            }
                        } label: {
                            Text("Post")

                                .bold()
                                .foregroundStyle(Theme.backgroundColor)
                                .frame(width: 100, height: 30)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Theme.backgroundColor, lineWidth: 1)
                                )
                                .background(Theme.textColor)
                                .cornerRadius(30)
                        }
                    }.padding()
                    Spacer()

                    Spacer()
                }
            }

            .navigationTitle("Reply to thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(Theme.textColor)
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .bold()
                            .foregroundColor(Theme.textColor)
                    }
                }
            }
        }
    }
}

struct FeedReplyView_preview: PreviewProvider {
    static var previews: some View {
        FeedReplyView(thread: dev.thread)
    }
}
