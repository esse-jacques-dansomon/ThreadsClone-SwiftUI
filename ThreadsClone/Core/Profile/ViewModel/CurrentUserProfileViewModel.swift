//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Foundation
import Combine

@MainActor
class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var threads = [Thread]()
    @Published var replies = [Reply]()
    @Published var reposts = [Repost]()
    @Published var likes = [Like]()
    @Published var followers = [Follow]()
    @Published var followings = [Follow]()

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers();
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink{ [weak self] currentUser in
            self?.currentUser = currentUser
            print("User changed \(String(describing: currentUser))")
            Task {
                if currentUser?.id != nil {
                    try await self?.fetchUserThreads();
                    try await self?.fetchUserReplies();
                    try await self?.fetchUserReposts();
                    try await self?.fetchUserPostLikes();
                    try await self?.getCurrentUserFollowers();
                    try await self?.getCurrentUserFollowings();
                }
            }
        }
        .store(in: &cancellables)
    }

    private func fetchUserThreads() async throws  {
        if let user = self.currentUser?.id {
            self.threads =  try await ThreadService.fectUserThreads(uid: user )
            for i in 0 ..< threads.count {
                threads[i].user = self.currentUser
            }
            self.threads = threads
        }
        print("fetchUserThreads .\(threads.count)")

    }

    private func fetchUserReplies() async throws  {
        var data =  try await ReplyService.fetchRepliesByUser(ownerId:self.currentUser?.id ?? "" )
        for i in 0 ..< data.count {
            data[i].user = self.currentUser
        }
        self.replies = data

    }

    private func fetchUserReposts() async throws  {
        let data =  await RepostService.getUserReposts(userId:self.currentUser?.id ?? "" )
        self.reposts = data
    }   

    private func fetchUserPostLikes() async throws  {
        var data = try await LikeService.fetchUserLikes(userId : self.currentUser?.id ?? "" )

        for i in 0 ..< data.count {
            var thread = try await ThreadService.loadThread(threadId:  data[i].threadId )
            if(thread.ownerUid == self.currentUser?.id) {
                thread.user = self.currentUser
            }else {
                let user =  try await UserService.fectUser(withUid: thread.ownerUid  )
                thread.user = user
            }
            data[i].thread = thread
        }
        self.likes = data

}

    private func getCurrentUserFollowers() async throws {
        guard let userID = currentUser?.id else {
            return
        }
        var data = try await FollowService.userFollowers(userID: userID);
        for i in 0 ..< data.count {
            let followerUser  = try await UserService.fectUser(withUid: data[i].followerUid)
            data[i].followedUser = currentUser
            data[i].followerUser = followerUser
        }

        self.followers = data
    }

    private func getCurrentUserFollowings() async throws  {
        guard let userID = currentUser?.id else {return }
       var  data = try await FollowService.userFollowings(userID: userID);
        for i in 0 ..< data.count {
            let followed  = try await UserService.fectUser(withUid: data[i].followedUid)
            data[i].followedUser = followed
            data[i].followerUser = currentUser
        }
        self.followings = data
    }

}
