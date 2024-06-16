//
//  ThreadsTextBtnView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct ThreadsTextBtnView: View {
    
    var title : String;
    var textColor: Color = .white
    var background: Color = .black
    
    
    var body: some View {
        Text(title)
            .font(.headline)
            .bold()
            .frame(maxWidth: .infinity)
            .foregroundStyle(textColor)
            .padding(10)
            .background(background)
            .cornerRadius(5)
    }
}

#Preview {
    ThreadsTextBtnView(title: "title")
}
