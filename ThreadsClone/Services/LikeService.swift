//
//  LikeService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@MainActor
class LikeService {


    static func likeThread(userId: String, threadId: String) {
        let db = Firestore.firestore()

        // Check if the user already liked the thread
        db.collection("likes")
            .whereField("userId", isEqualTo: userId)
            .whereField("threadId", isEqualTo: threadId)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error checking like status: \(error)")
                    return
                }

                guard let documents = snapshot?.documents else {
                    print("No like document found")
                    return
                }

                if documents.isEmpty {
                    // Add a new like document
                    let like = Like(userId: userId, threadId: threadId)
                    do {
                        _ = try db.collection("likes").addDocument(from: like)

                        // Increment the like count on the thread
                        db.collection("threads").document(threadId).updateData([
                            "likes": FieldValue.increment(Int64(1))
                        ])
                    } catch {
                        print("Error liking thread: \(error)")
                    }
                }
            }
    }

    static func unlikeThread(userId: String, threadId: String) {
        let db = Firestore.firestore()

        // Find the Like document
        db.collection("likes")
            .whereField("userId", isEqualTo: userId)
            .whereField("threadId", isEqualTo: threadId)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error finding like document: \(error)")
                    return
                }

                guard let documents = snapshot?.documents else {
                    print("No like document found")
                    return
                }

                for document in documents {
                    document.reference.delete { error in
                        if let error = error {
                            print("Error unliking thread: \(error)")
                        } else {
                            // Decrement the like count on the thread
                            db.collection("threads").document(threadId).updateData([
                                "likes": FieldValue.increment(Int64(-1))
                            ])
                        }
                    }
                }
            }
    }


    @MainActor
    static func userHasLikedThread(userId: String, threadId: String) async throws -> Bool {
        let snapshot = try await Firestore.firestore()
            .collection("likes")
            .whereField("userId", isEqualTo: userId)
            .whereField("threadId", isEqualTo: threadId)
            .getDocuments()

        return snapshot.documents.isEmpty ? false : true
    }
}
