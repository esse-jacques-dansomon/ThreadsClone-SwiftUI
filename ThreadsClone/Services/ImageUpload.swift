//
//  ImageUpload.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage( _ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")

        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("Debug error upload")
            return nil
        }
    }

    static func uploadMedia(mediaData: Data, mediaType: String, completion: @escaping (Result<String, Error>) -> Void) {
            let storage = Storage.storage()
            let fileName = UUID().uuidString + (mediaType == "image" ? ".jpg" : ".mp4")
            let storageRef = storage.reference().child("media/\(fileName)")

            storageRef.putData(mediaData, metadata: nil) { metadata, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                storageRef.downloadURL { url, error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    if let url = url {
                        completion(.success(url.absoluteString))
                    }
                }
            }
        }
}
