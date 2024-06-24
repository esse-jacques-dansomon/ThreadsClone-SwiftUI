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
                if let uid = UserService.shared.currentUser?.id  {
                    let hasLiked = try await LikeService.userHasLikedThread(userId: uid, threadId: thread.id)
                    threads[i].connectedUserHasLiked = hasLiked
                }

            }

        } catch {
            print("Error fetchUserThreads : \(error)")
        }
    }

    @MainActor
    func likeThread(thread: Thread) async throws {
        guard let uid = UserService.shared.currentUser?.id else { return }
        try await LikeService.likeThread(userId: uid, threadId: thread.id)
        try await reloadThread(thread: thread)
    }


    @MainActor
    private func reloadThread(thread: Thread) async throws {
        guard let uid = UserService.shared.currentUser?.id else { return }
        do {

            // Find the index of the thread in the threads array
            if let index = threads.firstIndex(where: { $0.id == thread.id }) {
                var updatedThread = try await ThreadService.loadThread(threadId: thread.id)
                let hasLiked = try await LikeService.userHasLikedThread(userId: uid, threadId: thread.id)
                // Replace the thread at the found index with the updated thread
                updatedThread.user = thread.user
                updatedThread.connectedUserHasLiked = hasLiked
                threads[index] = updatedThread

                print("user .\(uid) has like \(hasLiked), old likes \(thread.likes) new likes \(updatedThread.likes)")
            }
        } catch {
            print("Error reload : \(error)")
        }
    }
}
