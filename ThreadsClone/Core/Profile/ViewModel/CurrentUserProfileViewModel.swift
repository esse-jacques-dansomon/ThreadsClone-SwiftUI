//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Foundation
import Combine

@MainActor
class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var threads = [Thread]()

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers();
        Task {
            try await fetchUserThreads();
        }
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink{ [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }

    private func fetchUserThreads() async throws -> [Thread] {
        if self.currentUser != nil {
            self.threads =  try await ThreadService.fectUserThreads(uid: self.currentUser!.id )
        }
        return []
    }
}
