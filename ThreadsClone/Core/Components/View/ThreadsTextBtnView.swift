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

            .padding(6)


            .foregroundStyle(textColor)
            .background(background)
            .cornerRadius(10)
            .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(background, lineWidth: 1)
               )

    }
}

#Preview {
    ThreadsTextBtnView(title: "title")
}
