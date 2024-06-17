//
//  ThreadsTabBarView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ThreadsTabBarView: View {
    @State var selectedTab = 0
    @State var oldSelectedTav = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView().tabItem {
                Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                    .environment(\.symbolVariants, selectedTab == 0 ? .fill: .none)
            }
            .onAppear{ selectedTab = 0 ; oldSelectedTav = 0}
            .tag(0)
            
            ExplorerView().tabItem {
                Image(systemName:  "magnifyingglass" )
            }
            .onAppear{ selectedTab = 1 ; oldSelectedTav = 1}
            .tag(1)
            
            Text("").tabItem {
                Image(systemName: "plus")

            }
            .onAppear{ selectedTab = 2  }
            .tag(2)
            .sheet(isPresented: .constant(selectedTab == 2), onDismiss: {
                selectedTab = oldSelectedTav
            }, content: {
                FeedsCreationView(selectedTab: $selectedTab, oldSelectedTav: $oldSelectedTav)
            })

            ActivityView().tabItem {
                Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                    .environment(\.symbolVariants, selectedTab == 3 ? .fill: .none)
            }
            .onAppear{ selectedTab = 3; oldSelectedTav = 3 }
            .tag(3)
            
            
            CurrentUserProfile().tabItem {
                Image(systemName: selectedTab == 4 ? "person.fill" : "person")

                    .environment(\.symbolVariants, selectedTab == 4 ? .fill: .none)
            }

            .onAppear{ selectedTab = 4 ; oldSelectedTav = 4}
            .tag(4)
            
        }
        .background(.gray)
        .tint(.black)
        .onAppear{
            Task {
                try await  UserService.shared.fectCurrentUser()
            }
        }
    }
}

#Preview {
    ThreadsTabBarView()
}
