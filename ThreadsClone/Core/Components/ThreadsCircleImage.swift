//
//  ThreadsCircleImage.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ThreadsCircleImage: View {
    var body: some View {
        Image("profile")
            .resizable()
            .scaledToFit()
            .frame(width: 50)
            .clipShape(Circle())
    }
}

#Preview {
    ThreadsCircleImage()
}
