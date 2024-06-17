//
//  FeedCreationViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase

class FeedsCreationViewModel: ObservableObject {
    @Published var caption = ""

    @MainActor
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let  threadData = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(threadData)
    }
}
