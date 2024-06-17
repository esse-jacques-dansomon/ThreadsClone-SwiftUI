//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var threads = [Thread]()
    var user: User

    init(user: User) {
        self.user = user
        Task {
            try await fetchUserThreads(id:user.id)
        }
    }


    private func fetchUserThreads(id: String) async throws  {
        self.threads = []
        self.threads =  try await ThreadService.fectUserThreads(uid:  id )
    }
}
