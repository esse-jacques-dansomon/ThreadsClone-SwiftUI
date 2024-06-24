//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 30/05/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme


    @StateObject var viewModel  = ContentViewModel()

    var body: some View {
        ZStack {
            if (self.viewModel.showSplash) {
                Group {
                    if( viewModel.userSession != nil) {
                        ThreadsTabBarView()
                            .onAppear{
                                Task {
                                    try await  UserService.shared.fectCurrentUser()
                                }
                            }

                    }else {
                        SignInView()
                    }
                }
            }else {
                SplashScreenView()
            }
        } 
        .background(Theme.backgroundColor)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
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

#Preview {

        ContentView()
        .preferredColorScheme(.dark)


}

