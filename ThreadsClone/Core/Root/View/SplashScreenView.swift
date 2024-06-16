//
//  SplashScreenView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        Color.init(white: 3)
            .ignoresSafeArea()
            .overlay{
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                        .symbolEffect(.pulse, isActive: true)

                    Spacer()
                    VStack {
                        Text("from")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Image("meta")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 20)
                    }
                }
            }.foregroundStyle(.white)
    }
}
#Preview {
    SplashScreenView()
}
