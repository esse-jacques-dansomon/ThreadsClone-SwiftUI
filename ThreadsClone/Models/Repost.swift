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
    @DocumentID var postId: String?
    var userId: String // UID of the user who reposted
    var threadId: String // ID of the post that was reposted
    var  id: String {
        return postId ?? NSUUID().uuidString
    }
}
