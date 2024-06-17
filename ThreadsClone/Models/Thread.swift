//
//  Thread.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var reposts: Int

    @DocumentID var threadId: String?
    var  id: String {
        return threadId ?? NSUUID().uuidString
    }

    var user: User?
}
