//
//  ThreadItemViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 18/06/2024.
//

import Foundation

class ThreadItemViewModel: ObservableObject {

    @MainActor
    func likeThread(threadId: String)  {
        guard let uid = UserService.shared.currentUser?.id else { return }
        LikeService.likeThread(userId: uid, threadId: threadId)
    }

    @MainActor 
    func unLikeThread(threadId: String)  {
        guard let uid = UserService.shared.currentUser?.id else { return }
        LikeService.unlikeThread(userId: uid, threadId: threadId)
    }
}
