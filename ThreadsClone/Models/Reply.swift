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
    var  id: String {
        return replyId ?? NSUUID().uuidString
    }
    var userId: String // UID of the user who replied
    var threadId: String // ID of the post being replied to
    var content: String // Content of the reply
}
