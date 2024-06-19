//
//  ReplyService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class ReplyService {
    static func addReply(threadId: String, ownerUid: String, caption: String) {
        let db = Firestore.firestore()

        let reply = Reply(threadId: threadId, ownerUid: ownerUid, caption: caption, timestamp: Timestamp(), likes: [])
        do {
            _ = try db.collection("replies").addDocument(from: reply)
        } catch {
            print("Error adding reply: \(error)")
        }
    }

    static func fetchReplies(threadId: String) async throws -> [Reply] {
        let  snapshot = try await Firestore.firestore().collection("replies")
            .whereField("threadId", isEqualTo: threadId)
            .getDocuments()

        let replies = snapshot.documents.compactMap {
            try? $0.data(as: Reply.self)
        }

        return replies;
    }

    static func fetchRepliesByUser(ownerId: String) async throws -> [Reply] {
        let  snapshot = try await Firestore.firestore().collection("replies")
            .whereField("ownerUid", isEqualTo: ownerId)
            .getDocuments()

        let replies = snapshot.documents.compactMap {
            try? $0.data(as: Reply.self)
        }

        return replies;
    }

}
