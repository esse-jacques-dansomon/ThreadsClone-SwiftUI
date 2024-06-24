//
//  ThreadItemViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import Foundation

class ThreadItemViewModel: ObservableObject {

    @MainActor
    func likeThread(threadId: String)  async throws {
        guard let uid = UserService.shared.currentUser?.id else { return }
        do {
            try await LikeService.likeThread(userId: uid, threadId: threadId)

        }catch {
            print("Error when liking")
        }
    }

    @MainActor 
    func unLikeThread(threadId: String)  {
        guard let uid = UserService.shared.currentUser?.id else { return }
        LikeService.unlikeThread(userId: uid, threadId: threadId)
    }
}
