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
    case Reposts

    var title: String {
        switch  self {
        case .Threads: return "Threads"
        case .Replies: return "Replies"
        case .Reposts: return "Reposts"
        }
    }
    
    var id : Int  {
        return self.rawValue
    }
    
}
