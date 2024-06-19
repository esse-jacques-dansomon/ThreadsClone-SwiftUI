//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Firebase
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()

    var user = MockData.shared.user
    var thread:  Thread  {
        var d = MockData.shared.thread
        d.user = MockData.shared.user
        return d
    }
    var reply: Reply {
        var reply =  MockData.shared.reply
        reply.user = MockData.shared.user
        return reply
    }

}

class MockData {
    static let shared = MockData()
    var user = User(id: NSUUID().uuidString, fullname: "Developer", username: "the_developer", email: "developer@gmail.com")
    var thread = Thread(threadId: "1234", ownerUid: "1234", caption: "Hunter x hunter is Goat More complex apps have needs that are not quite supported well by standard navigation APIs, and your awareness and solutions to these use", timestamp: Timestamp(), likes: 90, user: nil, connectedUserHasLiked: true)
    var reply = Reply(threadId: "1234", ownerUid: "1234", caption: "For sure", timestamp: Timestamp(), likes: ["1234"])
}
