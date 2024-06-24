//
//  Reply.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Reply: Identifiable, Codable {
    
    @DocumentID var replyId: String?

    let threadId: String // The ID of the thread this reply belongs to
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    let likes: [String]

    var id: String {
        return replyId ?? NSUUID().uuidString
    }

    var user: User?
}
