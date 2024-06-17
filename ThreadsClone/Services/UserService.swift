//
//  UserService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Foundation
import Firebase

class UserService {
    static let shared = UserService()

    @Published var currentUser: User?

//    init() {
//        Task {
//            try await fectCurrentUser();
//        }
//    }


    @MainActor
    func fectCurrentUser() async  throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot =  try await Firestore.firestore().collection("users").document(uid).getDocument();
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("UserService \(user)" )
    }



    @MainActor
    static func fectUser(withUid uid: String) async  throws ->  User {
        let snapshot =  try await Firestore.firestore().collection("users").document(uid).getDocument();
       return try snapshot.data(as: User.self)

    }


    @MainActor
    static func fectUsers() async throws -> [User] {
        guard let uid = Auth.auth().currentUser?.uid else {return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self )})
        return users.filter({$0.id != uid})
    }

    func reset() {
        self.currentUser = nil;
    }

    @MainActor
    func updateUserProfileImage( withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        try await Firestore.firestore().collection("users")
            .document(currentUid).updateData(["profileImageUrl" : imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
