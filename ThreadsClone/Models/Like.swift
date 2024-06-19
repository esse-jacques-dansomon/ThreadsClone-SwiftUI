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
    @DocumentID var likeId: String?
    var userId: String // UID of the user who liked
    var threadId: String // ID of the post that was liked


    var  id: String {
        return likeId ?? NSUUID().uuidString
    }
}
