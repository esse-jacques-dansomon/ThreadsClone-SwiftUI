//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10 , id: \.self) {_ in 
                       ThreadItemView()
                    }
                }.padding()
            }
            .refreshable {
                
            }
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing){
                    Image(systemName: "arrow.counterclockwise")
                }
            }
           
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
