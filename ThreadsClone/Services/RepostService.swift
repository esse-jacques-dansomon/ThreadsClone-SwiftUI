//
//  RepostService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@MainActor
class RepostService {
    static func repostThread(userId: String, threadId: String) async  {

        let repost = Repost(userId: userId, threadId: threadId)
        do {
            _ =   try Firestore.firestore().collection("reposts").addDocument(from: repost)

            // Increment the repost count on the thread
            let threadRef =  Firestore.firestore().collection("threads").document(threadId)
            try await threadRef.updateData([
                "reposts": FieldValue.increment(Int64(1))
            ])
        } catch {
            print("Error reposting thread: \(error)")
        }
    }

    static func getUserReposts(userId: String) async -> [Repost] {
        do {
            let snapshot  =  try await Firestore.firestore()
                .collection("reposts").whereField("userId", isEqualTo: userId)
                .getDocuments()
            return snapshot.documents.compactMap { try? $0.data(as: Repost.self)}
        }catch {
            print("Error reposting thread: \(error)")
            return []
        }
    }
}
