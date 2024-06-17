//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation

@MainActor
class FeedViewModel : ObservableObject {
    @Published var threads = [Thread]()

    init() {
        Task {
            try await fetchThreads();
        }
    }

    func fetchThreads() async throws {
        self.threads = try await ThreadService.fectThreads()
        try await fetchUserThreads();
    }

    func fetchUserThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser =  try await UserService.fectUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
}
