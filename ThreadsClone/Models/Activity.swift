//
//  Activity.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import Foundation

enum ActivityType: String, Codable,  CaseIterable, Identifiable {
    case all = "ALL"
    case createdThread = "CREATED_THREAD"
    case likedThread = "LIKED_THREAD"
    case repliedThread = "REPLIED_THREAD"
    case followedUser = "FOLLOWED_USER"
    case repostedThread = "REPOSTED_THREAD"
    // Ajoutez d'autres types d'activité ici selon vos besoins

    var id : String  {
        return self.rawValue
    }

    var title: String {
        switch  self {
        case .all: return "All"
        case .createdThread: return "Threads"
        case .likedThread: return "Liked"
        case .repliedThread: return "Replies"
        case .followedUser: return "Followings"
        case .repostedThread: return "Reposts"
        }
    }

}


struct Activity: Identifiable, Codable {
    @DocumentID var activityId: String?
    var type: ActivityType // Type of activity (e.g., "CREATED_THREAD", "LIKED_THREAD")
    var userID: String
    var threadID: String? // Optional thread ID (relevant for likes, replies etc.)
    var followerID: String? // Optional thread ID (relevant for likes, replies etc.)
    var repostID: String? // Optional thread ID (relevant for likes, replies etc.)
    var timestamp: Timestamp

    var id: String {
        return activityId ?? NSUUID().uuidString
    }
}
