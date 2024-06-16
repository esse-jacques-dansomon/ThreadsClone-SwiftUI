//
//  FeedsCreationView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct FeedsCreationView: View {
    @State var thread : String = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack (alignment: .top) {
                    ThreadsCircleImage()
                    VStack {
                        HStack {
                            Text("esse_jacques")
                            Spacer()
                            Image(systemName: "xmark")
                        }
                        TextField("Threads", text: $thread)
                        Spacer()
                    }

                }

            }
            .padding()
            .navigationTitle("New Thread")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {} label: {
                            Text("Cancel")
                                .foregroundStyle(.black)
                        }
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button {} label: {
                            Text("Post")
                                .bold()
                                .foregroundStyle(.black)
                        }
                    }
                }
        }

    }
}

#Preview {
    FeedsCreationView()
}
