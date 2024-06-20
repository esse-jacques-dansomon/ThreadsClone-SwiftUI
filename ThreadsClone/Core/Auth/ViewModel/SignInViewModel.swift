//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Firebase
import FirebaseAuth
import Foundation

enum SignInError: LocalizedError, Identifiable {
    case invalidEmail
    case invalidAppCredential
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return "The email address is invalid."
        case .invalidAppCredential:
            return "The password is invalid or the user does not have a password."
        case .unknownError:
            return "An unknown error occurred. Please try again."
        }
    }

    var id: String { localizedDescription }
}

@MainActor
class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: SignInError?

    func login() async {
        do {
            try await AuthService.shared.login(withEmail: email, password: password)
        } catch let err  {
            self.error = self.mapAuthError(err as NSError)
        }
    }

    private func mapAuthError(_ error : NSError) -> SignInError {
        if let err = error as NSError? {
            let errCode = AuthErrorCode(_nsError: err)
            _ = errCode.localizedDescription
            switch errCode.code {
            case .accountExistsWithDifferentCredential, .credentialAlreadyInUse, .emailAlreadyInUse, .missingEmail:
                return .invalidEmail
            case .invalidAppCredential, .wrongPassword:
                return .invalidAppCredential
            default:
                return .unknownError
            }
        }
    }
}
