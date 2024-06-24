//
//  AppState.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 20/06/2024.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var appData = AppData()
    @Published var currentUserData = UserData()
    @Published var selectedUserData = UserData()
    @Published var selectedThreadData = SelectedThreadData()
}

class AppData: ObservableObject {
    @Published var threads: [Thread] = []
    @Published var users: [User] = []
    @Published var threadActivities: [Activity] = []
}

class UserData: ObservableObject {
    @Published var user: User? = nil
    @Published var userActivities: [Activity] = []
    @Published var userThreads: [Thread] = []
    @Published var userReplies: [Reply] = []
    @Published var userReposts: [Repost] = []
    @Published var followers: [Follow] = []
    @Published var followings: [Follow] = []
}


class SelectedThreadData: ObservableObject {
    @Published var thread: [Thread] = []
    @Published var replies: [Reply] = []
    @Published var reposts: [Repost] = []
    @Published var activities: [Activity] = []
}
