//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Firebase
import FirebaseFirestoreSwift


class AuthService {

    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser
    }

    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result =  try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user // set the session
            try await UserService.shared.fectCurrentUser(); // fetch user info
        } catch {
            throw error
        }
    }

    @MainActor
    func createUser(withEmail email: String,
                    password: String,  fullname: String, username: String
    )  async throws {

        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user // set the session 
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            throw error
        }
    }

    @MainActor
   private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    )  async throws {

        let user = User(id: id, fullname: fullname, username: username, email: email);
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }

    @MainActor
    func singOut() {
        try?  Auth.auth().signOut() // signout in backend
        self.userSession = nil // sign out in the app frontend
        UserService.shared.reset(); // reset the fetch user
    }
}
