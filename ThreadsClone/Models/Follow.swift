//
//  Follow.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Follow: Identifiable, Codable, Hashable {
    @DocumentID var followId: String?
    let followerUid: String // UID of the user who is following
    let followedUid: String // UID of the user being followed
    var timestamp: Timestamp
    var  id: String {
        return followId ?? NSUUID().uuidString
    }

    var followerUser: User?
    var followedUser: User?
}
