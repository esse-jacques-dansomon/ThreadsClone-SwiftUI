//
//  ThreadsFormFieldView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct ThreadsFormFieldView: View {
    @Binding var text: String
    var title: String
    var isSecureField :Bool = false
    var body: some View {
        if ( isSecureField) {
            SecureField(title, text: $text)
                .modifier(ThreadsTextFieldModifier())
              
        }else {
            TextField(title, text: $text)
                .modifier(ThreadsTextFieldModifier())
            
        }
 
    }
}

#Preview {
    ThreadsFormFieldView(
        text: .constant(""),
        title: "Email"
    )
}
