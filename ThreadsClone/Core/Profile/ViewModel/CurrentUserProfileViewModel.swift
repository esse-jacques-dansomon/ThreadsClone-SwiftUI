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
    @Published var likes = [Like]()

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers();
        Task {
            try await fetchUserThreads();
            print("CurrentUserProfileViewModel")
        }
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink{ [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }

    private func fetchUserThreads() async throws  {
        if let user = self.currentUser?.id {
            self.threads =  try await ThreadService.fectUserThreads(uid: user )
        }
    }
}
