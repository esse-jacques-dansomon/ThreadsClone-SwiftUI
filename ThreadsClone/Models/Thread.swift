//
//  Thread.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable, Hashable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var reposts: Int?
    var  id: String {
        return threadId ?? NSUUID().uuidString
    }
    //var files: [String]?

    var user: User?
    var connectedUserHasLiked: Bool? 

}
