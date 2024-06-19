//
//  ExplorerView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ExplorerView: View {
    @State var search : String = ""
    @EnvironmentObject var viewModel : ExploreViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(
                            destination:   ProfileView(user: user)) {
                                VStack {
                                    ThreadsUserItemIView( user: user)
                                    Divider()
                                }
                            }
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $search, prompt: "Search")
            
        }
    }
}

#Preview {
    ExplorerView()
        .environmentObject(ExploreViewModel())
}
