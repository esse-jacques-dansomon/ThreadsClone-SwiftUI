//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}


class DeveloperPreview {
    static let shared = DeveloperPreview()

    let user = User(id: NSUUID().uuidString, fullname: "Developer", username: "the_developer", email: "developer@gmail.com")
    let thread = Thread( threadId: "1234", ownerUid: "1234", caption: "", timestamp: Timestamp(), likes: 90)
}
