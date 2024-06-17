//
//  ExplorerView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ExplorerView: View {
    @State var search : String = ""
    @StateObject var viewModel = ExploreViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                ThreadsUserItemIView(user: user)
                                Divider()
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $search, prompt: "Search")
            
        }
    }
}

#Preview {
    ExplorerView()
}
