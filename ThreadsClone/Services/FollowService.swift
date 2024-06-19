//
//  FollowService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 19/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class FollowService {


    static func followUser(follow: Follow) async throws -> Follow? {
        let db = Firestore.firestore()
         // Check for existing follow relationship
         let querySnapshot = try await db.collection("followers")
             .whereField("followerUid", isEqualTo: follow.followerUid)
             .whereField("followedUid", isEqualTo: follow.followedUid)
             .getDocuments()

         // If no existing relationship, create a new follow
         if querySnapshot.documents.isEmpty {
             guard let followerData = try? Firestore.Encoder().encode(follow) else { return nil }
             let followRef = try await db.collection("followers").addDocument(data: followerData)
             print("User followed successfully")
             return try await followRef.getDocument(as: Follow.self)
         } else {
             print("Follow relationship already exists")
             return nil
         }
     }

    static func unfollowUser(followerUid: String, followedUid: String) async throws {
        let db = Firestore.firestore()

        let querySnapshot = try await db.collection("followers")
            .whereField("followerUid", isEqualTo: followerUid)
            .whereField("followedUid", isEqualTo: followedUid)
            .getDocuments()

        for document in querySnapshot.documents {
            try await document.reference.delete()
        }

        print("User unfollowed successfully")
    }

//    static func unfollowUser(followerUid: String, followedUid: String) async throws {
//        let db = Firestore.firestore()
//        let querySnapshot = try await db.collection("followers")
//            .whereField("followerUid", isEqualTo: followerUid)
//            .whereField("followedUid", isEqualTo: followedUid)
//            .getDocuments()
//
//        for document in querySnapshot.documents {
//             try await document.reference.delete()
//         }
//    }


   static func userFollowers(userID: String) async throws -> [Follow] {
        let db = Firestore.firestore()
       let querySnapshot = try await db.collection("followers").whereField("followedUid", isEqualTo: userID).getDocuments()

       return querySnapshot.documents.compactMap{  try? $0.data(as: Follow.self)}
    }


    static func userFollowings(userID: String) async throws -> [Follow] {
        let db = Firestore.firestore()
        let querySnapshot = try await db.collection("followers").whereField("followerUid", isEqualTo: userID).getDocuments()

        return querySnapshot.documents.compactMap{  try? $0.data(as: Follow.self)}
    }



}
