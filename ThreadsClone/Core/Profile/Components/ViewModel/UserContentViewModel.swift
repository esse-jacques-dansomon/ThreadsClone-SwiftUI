//
//  UserContentViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import SwiftUI


class UserContentViewModel: ObservableObject {
    @Published var threads = [Thread]()
    @Published var replies = [Reply]()
    @Published var reposts = [Repost]()

    var user: User

    init(user: User) {
        self.user = user
        Task {
            try await fetchUserThreads()
            try await fetchUserReplies()
            //try await fetchUserReposts(ownerId: user.id)
        }
    }


    @MainActor
    private func fetchUserThreads() async throws  {
        self.threads = []
        var threads =  try await ThreadService.fectUserThreads(uid:  self.user.id )
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        self.threads = threads
        print("Profile user threads \( self.user.fullname ) \(self.threads)")

    }

    @MainActor
    private func fetchUserReplies() async throws  {
        var data =  try await ReplyService.fetchRepliesByUser(ownerId:self.user.id )
        for i in 0 ..< data.count {
            data[i].user = self.user
        }
        self.replies = data

    }

    @MainActor
    private func fetchUserReposts(ownerId: String) async throws  {
        let data =  await RepostService.getUserReposts(userId:self.user.id )
//        for i in 0 ..< data.count {
//            let threadId =
//            data[i].user = self.user
//        }
//        print(data)
        self.reposts = data

    }
}
