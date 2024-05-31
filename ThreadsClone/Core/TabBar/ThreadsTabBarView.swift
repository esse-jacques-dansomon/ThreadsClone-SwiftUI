//
//  ThreadsTabBarView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ThreadsTabBarView: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ExplorerView().tabItem {
                Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                    .environment(\.symbolVariants, selectedTab == 0 ? .fill: .none)
            }
            .onAppear{ selectedTab = 0 }
            .tag(0)
            
            FeedView().tabItem {
                Image(systemName:  "magnifyingglass" )
            }
            .onAppear{ selectedTab = 1 }
            .tag(1)
            
            FeedsCreationView().tabItem {
                Image(systemName: "plus")
            }
            .onAppear{ selectedTab = 2 }
            .tag(2)
            
            ActivityView().tabItem {
                Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                    .environment(\.symbolVariants, selectedTab == 3 ? .fill: .none)
            }
            .onAppear{ selectedTab = 3 }
            .tag(3)
            
            
            ProfileView().tabItem {
                Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                    .environment(\.symbolVariants, selectedTab == 4 ? .fill: .none)
            }
            .onAppear{ selectedTab = 4 }
            .tag(4)
            
        }.tint(.black)
    }
}

#Preview {
    ThreadsTabBarView()
}
