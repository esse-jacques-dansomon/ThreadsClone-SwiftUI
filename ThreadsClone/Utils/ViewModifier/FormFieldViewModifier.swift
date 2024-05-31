//
//  FormFieldViewModifier.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
            .padding()
            .foregroundColor(.gray)
            .background(Color(.systemGray6))
            .cornerRadius(6.0)
    }
}
