//
//  Like.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Like: Identifiable, Codable {
    var userId: String // UID of the user who liked
    var threadId: String // ID of the post that was liked

    @DocumentID var likeId: String?
    var  id: String {
        return likeId ?? NSUUID().uuidString
    }
}
