//
//  ProfileThreadsFilter.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import Foundation


enum ProfileThreadsFilter : Int, CaseIterable, Identifiable {
    case Threads
    case Replies
//    case Messages
    
    var title: String {
        switch  self {
        case .Threads: return "Threads"
        case .Replies: return "Replies"
//        case .Messages: return "Messages"
        }
    }
    
    var id : Int  {
        return self.rawValue
    }
    
}
