//
//  ThreadsextBtnView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct ThreadsextBtnView: View {
    
    var title : String;
    
    var body: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .padding()
            .background(.black)
            .cornerRadius(5)
    }
}

#Preview {
    ThreadsextBtnView(title: "title")
}
