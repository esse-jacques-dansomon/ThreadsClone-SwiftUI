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

    var user: User

    init(user: User) {
        self.user = user
        Task {
            try await fetchUserThreads(id:user.id)
        }
    }


    @MainActor
    private func fetchUserThreads(id: String) async throws  {
        self.threads = []
        var threads =  try await ThreadService.fectUserThreads(uid:  id )
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        self.threads = threads

    }
}
