//
//  ThreadsTabBarView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ThreadsTabBarView: View {
    @State var selectedTab = 0
    @State var oldSelectedTab = 0

    @StateObject private var feedViewModel = FeedViewModel()
    @StateObject private var feedDetailsViewModel = FeedDetailsViewModel()
    @StateObject private var exploreViewModel = ExploreViewModel()
    @StateObject private var currentUserProfileViewModel = CurrentUserProfileViewModel()
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView().tabItem {
                Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                    .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
            }
            .onAppear {
                selectedTab = 0
                oldSelectedTab = 0
            }
            .tag(0)

            ExplorerView().tabItem {
                Image(systemName: "magnifyingglass")
            }
            .onAppear {
                selectedTab = 1
                oldSelectedTab = 1
            }
            .tag(1)

            Text("")
                .tabItem {
                    VStack {
                        Image(systemName: "plus.square.fill")
                            .font(.title)
                        /*mage("logo")*/
                    }
                }.font(.title)
                .onAppear { selectedTab = 2 }
                .tag(2)
                .sheet(isPresented: .constant(selectedTab == 2), onDismiss: {
                    selectedTab = oldSelectedTab
                }, content: {
                    FeedsCreationView(selectedTab: $selectedTab, oldSelectedTab: $oldSelectedTab)
                })

            ActivityView().tabItem {
                Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                    .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
            }
            .onAppear { selectedTab = 3; oldSelectedTab = 3 }
            .tag(3)

            CurrentUserProfile().tabItem {
                Image(systemName: selectedTab == 4 ? "person.fill" : "person")

                    .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
            }

            .onAppear { selectedTab = 4; oldSelectedTab = 4 }
            .tag(4)
        }
        .edgesIgnoringSafeArea(.bottom)
        .environmentObject(currentUserProfileViewModel)
        .environmentObject(feedViewModel)
        .environmentObject(feedDetailsViewModel)
        .environmentObject(exploreViewModel)
        .tint(colorScheme == .dark ? .white : .black)
        .background(Theme.backgroundColor)
        .onAppear {
            Task {
                try await feedViewModel.fetchThreads()
            }
        }
    }
}

struct ThreadsTabBarView_preview: PreviewProvider {
    static var previews: some View {
        Group {
            ThreadsTabBarView()
                .environmentObject(CurrentUserProfileViewModel())
                .environmentObject(FeedViewModel())
                .environmentObject(FeedDetailsViewModel())
                .environmentObject(ExploreViewModel())
                .preferredColorScheme(.light)
        }
    }
}

struct ThreadsTabBarViewDakar_preview: PreviewProvider {
    static var previews: some View {
        Group {
            ThreadsTabBarView()
                .environmentObject(CurrentUserProfileViewModel())
                .environmentObject(FeedViewModel())
                .environmentObject(FeedDetailsViewModel())
                .environmentObject(ExploreViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
