//
//  AppLogoView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct AppLogoView: View {
    var body: some View {
    
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width:100)
            .padding()
    }
}

#Preview {
    AppLogoView()
}
