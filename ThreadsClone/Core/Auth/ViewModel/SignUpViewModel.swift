//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Firebase
import FirebaseAuth
import Foundation

enum SignUpError: LocalizedError, Identifiable {
    case emailAlreadyInUse
    case invalidEmail
    case weakPassword
    case invalidAppCredential
    case unknownError

    var errorDescription: String? {
        switch self {
        case .emailAlreadyInUse:
            return "This email address is already in use."
        case .invalidEmail:
            return "The email address is invalid."
        case .weakPassword:
            return "The password is too weak."    
        case .invalidAppCredential:
            return "The password is invalid or the user does not have a password."
        case .unknownError:
            return "An unknown error occurred. Please try again."
        }
    }

    var id: String { localizedDescription }


}

@MainActor
class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var fullname: String = ""
    @Published var password: String = ""
    @Published var error: SignUpError?


    func createUser() async {
        do {
            try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname, username: username)
        } catch let err as NSError {
            self.error = self.mapAuthError(err)
        } catch {
            self.error = .unknownError
        }
    }

    private func mapAuthError(_ error : NSError) -> SignUpError {
        print("DEBUG: Error code \(error)")
        if let err = error as NSError? {
            let errCode = AuthErrorCode(_nsError: err)
            _ = errCode.localizedDescription
            switch errCode.code {
            case .accountExistsWithDifferentCredential, .credentialAlreadyInUse, .emailAlreadyInUse:
                return .emailAlreadyInUse
            case .missingEmail:
                return .invalidEmail
            case .weakPassword:
                return .weakPassword     
            case .invalidAppCredential, .wrongPassword:
                return .invalidAppCredential
            default:
                return .unknownError
            }
        }
    }
}
