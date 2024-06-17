//
//  Repost.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Repost: Identifiable, Codable {
    var userId: String // UID of the user who reposted
    var threadId: String // ID of the post that was reposted
    @DocumentID var postId: String?
    var  id: String {
        return postId ?? NSUUID().uuidString
    }
}
