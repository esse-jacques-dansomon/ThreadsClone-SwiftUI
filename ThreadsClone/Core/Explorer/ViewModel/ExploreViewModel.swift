//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {

    @Published var users = [User]()

    init() {
        Task {
            try await fetchUsers()
        }
    }

    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fectUsers();
    }
}
