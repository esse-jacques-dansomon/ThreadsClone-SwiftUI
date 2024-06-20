//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import Foundation
import Firebase

@MainActor
class ExploreViewModel: ObservableObject {

    @Published var users = [User]()
    @Published var followers = [Follow]()
    @Published var followings = [Follow]()

    init() {
        Task {
            try await fetchUsers()
        }
    }

    func isFollowingUser(followedID: String) -> Bool {
        return (followings.first { follow in
            follow.followedUid == followedID
        } != nil)
    }

     func fetchUsers() async throws {
        self.users = try await UserService.fectUsers();
        try await getCurrentUserFollowers()
        try await getCurrentUserFollowings()
    }

    private func getCurrentUserFollowers() async throws {
        guard let userID = UserService.shared.currentUser?.id else {
            return
        }
        self.followers = try await FollowService.userFollowers(userID: userID);
    }

    private func getCurrentUserFollowings() async throws {
        guard let userID = UserService.shared.currentUser?.id else {return }
        self.followings = try await FollowService.userFollowings(userID: userID);
    }


    func followerUser(followedUserID: String) async throws {
        guard let followerId = UserService.shared.currentUser?.id else {return }
        let follower = Follow(followerUid:followerId, followedUid: followedUserID, timestamp: Timestamp())
        let follow  = try await FollowService.followUser(follow: follower)
        //reload userFollow
        if let f = follow {
            self.followers.append(f)
            self.followings.append(f)
        }
    }

    func unFollowerUser(followedUid: String) async throws {
        guard let followerUid = UserService.shared.currentUser?.id else {return }
        try await FollowService.unfollowUser(followerUid: followerUid, followedUid: followedUid)
        //reload userFollow
        try await getCurrentUserFollowers()
        try await getCurrentUserFollowings()
    }

}
