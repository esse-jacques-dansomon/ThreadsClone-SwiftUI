//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    @Published var userSession: FirebaseAuth.User?
    @Published var showSplash: Bool = false


    init() {
       self.setUpSubscribers();
    }

    func setUpSubscribers(){
        AuthService.shared.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables) // Store the subscription

    }

}
