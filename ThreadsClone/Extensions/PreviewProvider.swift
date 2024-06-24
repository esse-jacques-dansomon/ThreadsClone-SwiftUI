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
        d.mediaUrls = MockData.shared.medialsUrl
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

    var medialsUrl = [
        "https://imgs.search.brave.com/c0J7wzJtFKJ0z9_SWVmVO0j9srgMIBDIJwj3eBuarZo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL00v/TVY1Qk1HVTFPV0Zq/TkdNdFpUVmtOUzAw/TkRjeExXSTBZbUV0/TURneFlqQm1NRGRs/TlRSa1hrRXlYa0Zx/Y0dkZVFYVnlOakF3/TkRVeE9ESUAuanBn",
        "https://imgs.search.brave.com/lBNbAJ0MojSYKET0_3IR4wXQnCyGB72e-OMdhQz04hE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzgxYnJDaUxDZHZM/LmpwZw"

    ]
}
