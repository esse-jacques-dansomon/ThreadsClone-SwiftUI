//
//  FeedCreationViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase

@MainActor
class FeedsCreationViewModel: ObservableObject {
    @Published var caption = ""
    @Published var mediaData: [Data] = []
    @Published var mediaTypes: [String] = [] // "image" or "video"
    @Published var isLoading: Bool = false
    @Published var sucess: Bool = false
    @Published var errorMessage: String? = nil

    @MainActor
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let  threadData = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0, reposts: 0)
        try await ThreadService.uploadThread(threadData)
    }

    func createThread() async {
        guard !caption.isEmpty else {
            errorMessage = "Thread text cannot be empty."
            return
        }

        isLoading = true
        sucess = false
        var mediaUrls: [String] = []

        for (index, data) in mediaData.enumerated() {
            let mediaType = mediaTypes[index]
            do {
                let url = try await uploadMedia(data: data, mediaType: mediaType)
                mediaUrls.append(url)
            } catch {
                errorMessage = "Failed to upload media: \(error.localizedDescription)"
                isLoading = false
                return
            }
        }
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let  threadData = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0, reposts: 0, mediaUrls: mediaUrls )

        do {
            try await ThreadService.uploadThread(threadData)
            isLoading = false
            sucess = true
        } catch {
            errorMessage = "Failed to create thread: \(error.localizedDescription)"
            isLoading = false
            sucess = false
        }
    }

    private func uploadMedia(data: Data, mediaType: String) async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            ImageUploader.uploadMedia(mediaData: data, mediaType: mediaType) { result in
                switch result {
                case .success(let url):
                    continuation.resume(returning: url)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func removeMedia(at index: Int) {
         guard index >= 0 && index < mediaData.count else { return }
         mediaData.remove(at: index)
         mediaTypes.remove(at: index)
     }

    
}
