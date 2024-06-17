//
//  FeedsCreationView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct FeedsCreationView: View {
    @Binding var selectedTab : Int
    @Binding var oldSelectedTav : Int

    @StateObject var viewModel = FeedsCreationViewModel()

    private var user: User? {
        return UserService.shared.currentUser
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack (alignment: .top) {
                    ThreadsCircleImage(user: user)
                    VStack {
                        HStack {
                            Text(user?.fullname ?? "")
                            Spacer()
                            if !viewModel.caption.isEmpty {
                                Button {
                                    viewModel.caption = ""
                                } label: {
                                    Image(systemName: "xmark")
                                }
                            }

                        }
                        TextField("Start a thread", text: $viewModel.caption, axis: .vertical)
                        Spacer()
                    }

                }

            }
            .padding()
            .navigationTitle("New Thread")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                                    selectedTab = oldSelectedTav
                                    print("Hello")
                                }) {
                                    Text("Cancel")
                                        .foregroundColor(.black)
                                }
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            Task {
                                try await viewModel.uploadThread()

                                selectedTab = oldSelectedTav
                            }

                        } label: {
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
    FeedsCreationView(
        selectedTab: .constant(2), oldSelectedTav: .constant(3)
    )
}
