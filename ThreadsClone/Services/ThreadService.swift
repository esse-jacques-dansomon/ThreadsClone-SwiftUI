//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

class ThreadService {

    static func uploadThread(_ thread: Thread) async throws -> String? {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return nil }
      let documentRef = try await Firestore.firestore().collection("threads").addDocument(data: threadData)

        return  try await documentRef.getDocument(as: Thread.self).id
    }

    static func fectThreads() async throws -> [Thread] {
        let snapshot = try await
            Firestore
            .firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()

        return snapshot.documents.compactMap {
            try? $0.data(as: Thread.self)
        }
    }

    static func fectUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await
            Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()

        let threads = snapshot.documents.compactMap {
            try? $0.data(as: Thread.self)
        }
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }

    static func loadThread(threadId: String) async throws -> Thread {
        let snapshot = try await Firestore.firestore()
            .collection("threads")
            .document(threadId)
            .getDocument()

        return try snapshot.data(as: Thread.self)

    }
}
