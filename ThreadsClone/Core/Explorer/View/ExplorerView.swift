//
//  ExplorerView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ExplorerView: View {
    @State var search : String = "";
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(1 ... 20,id: \.self) { _ in
                        VStack {
                            ThreadsUserItemIView()
                            Divider()
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $search)
            
        }
    }
}

#Preview {
    ExplorerView()
}
