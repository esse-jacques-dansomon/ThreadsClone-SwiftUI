//
//  ActivityService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 19/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class ActivityService {

    static func addActivity(activity: Activity) async throws {
        let db = Firestore.firestore()
        guard let activityData = try? Firestore.Encoder().encode(activity)  else { return }
        try await db.collection("activities").addDocument(data: activityData)
        print("Activity added successfully")
    }

    //getUserActivy
    static func getUserActivities(userID: String) async throws -> [Activity] {
        let db = Firestore.firestore()
        let querySnapshot = try await db.collection("activities").whereField("userID", isEqualTo: userID).getDocuments()

        var activities: [Activity] = []
        for document in querySnapshot.documents {
            if let activity = try? document.data(as: Activity.self) {
                activities.append(activity)
            }
        }
        return activities
    }

    //getThreadActivy
    static func getThreadActivities(threadID: String) async throws -> [Activity] {
        let db = Firestore.firestore()
        let querySnapshot = try await db.collection("activities").whereField("threadID", isEqualTo: threadID).getDocuments()

        var activities: [Activity] = []
        for document in querySnapshot.documents {
            if let activity = try? document.data(as: Activity.self) {
                activities.append(activity)
            }
        }
        return activities
    }

}
