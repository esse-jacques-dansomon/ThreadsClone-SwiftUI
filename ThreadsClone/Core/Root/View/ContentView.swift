//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel  = ContentViewModel()
    var body: some View {
        ZStack {
            if (self.viewModel.showSplash) {
                Group {
                    if( viewModel.userSession != nil) {
                        ThreadsTabBarView()
                    }else {
                        SignInView()
                    }
                }
            }else {
                SplashScreenView()
            }
        }  .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.viewModel.showSplash = true
                }
            }
        }


    }
}

#Preview {
    ContentView()
}
