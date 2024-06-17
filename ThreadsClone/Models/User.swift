//
//  User.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    var fullname: String
    var username: String
    var email: String
    var profileImageUrl: String?
    var bio: String?
}
