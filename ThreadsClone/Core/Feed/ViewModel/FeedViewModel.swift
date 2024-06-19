//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Combine
import Foundation

class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()

    @MainActor
    func fetchThreads() async throws {
        threads = try await ThreadService.fectThreads()
        try await fetchUserThreads()
    }

    @MainActor
    func fetchUserThreads() async throws {
        do {
            for i in 0 ..< threads.count {
                let thread = threads[i]
                let ownerUid = thread.ownerUid
                let threadUser = try await UserService.fectUser(withUid: ownerUid)
                threads[i].user = threadUser

                guard let uid = UserService.shared.currentUser?.id else { return }
                let hasLiked = try await LikeService.userHasLikedThread(userId: uid, threadId: thread.id)
                threads[i].connectedUserHasLiked = hasLiked
            
            }
        } catch {
            print("Error fetchUserThreads : \(error)")
        }
    }

    @MainActor
    func likeThread(thread: Thread) async throws  {
        guard let uid = UserService.shared.currentUser?.id else { return }
        LikeService.likeThread(userId: uid, threadId: thread.id)
        try await reloadThread(thread: thread)
    }

    @MainActor
    func unLikeThread(thread: Thread) async throws  {
        guard let uid = UserService.shared.currentUser?.id else { return }
        LikeService.unlikeThread(userId: uid, threadId: thread.id)
        try await reloadThread(thread: thread)
    }

    @MainActor
   private func reloadThread(thread: Thread) async throws {
        guard let uid = UserService.shared.currentUser?.id else { return }
        do {
            let hasLiked = try await LikeService.userHasLikedThread(userId: uid, threadId: thread.id)
             var updatedThread = try await ThreadService.loadThread(threadId: thread.id)
            // Find the index of the thread in the threads array
            if let index = threads.firstIndex(where: { $0.id == thread.id }) {
                updatedThread.user = thread.user
                updatedThread.connectedUserHasLiked = hasLiked
                print(hasLiked)
                // Replace the thread at the found index with the updated thread
                threads[index] = updatedThread
                print(updatedThread.likes)
            }
        } catch {}
    }
}
