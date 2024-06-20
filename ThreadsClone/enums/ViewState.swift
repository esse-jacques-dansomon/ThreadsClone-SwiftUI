//
//  ViewState.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 20/06/2024.
//

import Foundation

enum ViewState<T> {
    case loading
    case success(T)
    case error(Error)
}
