//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Foundation
import FirebaseAuth


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
            print("Debug: Create user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
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
            print("Debug: Create user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            throw error
        }
    }

    func singOut() {
        try? Auth.auth().signOut() // signout in backend
        self.userSession = nil // sign out in the app frontend 
    }
}
