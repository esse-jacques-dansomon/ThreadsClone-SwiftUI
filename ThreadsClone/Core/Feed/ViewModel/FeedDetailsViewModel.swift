//
//  FeedDetailsViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import Foundation

@MainActor
class FeedDetailsViewModel: ObservableObject {

    @Published var replies = [Reply]()

    func fetchReplies(threadId: String) async throws  {
        let replies = try await ReplyService.fetchReplies(threadId: threadId)
        self.replies =  replies
        try await mapReplyToUser()
    }


    func replyThread(thread: Thread, caption: String) async throws  {
        guard let uid = UserService.shared.currentUser?.id else { return }
        ReplyService.addReply(threadId: thread.id, ownerUid: uid, caption: caption)
        try await fetchReplies(threadId: thread.id)
    }


    private func mapReplyToUser() async throws{
        for i in  0..<replies.count  {
            let reply = replies[i]
            let ownerUid = reply.ownerUid
            let user = try await UserService.fectUser(withUid: ownerUid)
            replies[i].user = user
        }
    }


}
