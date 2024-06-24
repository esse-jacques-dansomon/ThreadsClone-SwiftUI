//
//  VideoPicker.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 19/06/2024.
//

import Foundation
import SwiftUI
import UIKit

struct VideoPicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var completion: (URL) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(completion: completion)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.mediaTypes = ["public.movie"]
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var completion: (URL) -> Void

        init(completion: @escaping (URL) -> Void) {
            self.completion = completion
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let url = info[.mediaURL] as? URL {
                completion(url)
            }
            picker.dismiss(animated: true)
        }
    }
}
