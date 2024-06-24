//
//  SplashScreenView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 16/06/2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        Theme.backgroundColor
            .ignoresSafeArea()
            .overlay{
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Theme.textColor)
                        .symbolEffect(.pulse, isActive: true)

                    Spacer()
                    VStack {
                        Text("from")
                            .font(.caption)
                            .foregroundStyle(Theme.textColor)
                        Image("meta")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 20)
                    }
                }
            }
            .foregroundStyle(Theme.textColor)
    }
}

#Preview {
    SplashScreenView()
}
#Preview {
    SplashScreenView()
        .preferredColorScheme(.dark)
}
