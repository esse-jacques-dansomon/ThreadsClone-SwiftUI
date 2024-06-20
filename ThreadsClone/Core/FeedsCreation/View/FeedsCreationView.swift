//
//  FeedsCreationView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct FeedsCreationView: View {
    @Binding var selectedTab: Int
    @Binding var oldSelectedTav: Int

    @State private var isShowingImagePicker = false
    @State private var isShowingVideoPicker = false

    @StateObject var viewModel = FeedsCreationViewModel()

    private var user: User? {
        return UserService.shared.currentUser
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    ThreadsCircleImage(user: user, size: .medium)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(user?.fullname ?? "esse_jacques")
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
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding(.vertical, 3)
                        }

                        if viewModel.mediaData.count > 0 {
                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    ForEach(0 ..< viewModel.mediaData.count, id: \.self) { index in
                                        if viewModel.mediaTypes[index] == "image" {
                                            if let uiImage = UIImage(data: viewModel.mediaData[index]) {
                                                ZStack(alignment: .topTrailing) {
                                                    Image(uiImage: uiImage)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 100, height: 100)
                                                        .padding(.horizontal)

                                                    Button {
                                                        viewModel.removeMedia(at: index)

                                                    } label: {
                                                        Image(systemName: "xmark.circle.fill")
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 20, height: 20)
                                                            .foregroundStyle(.white)
                                                            .offset(x: -5, y: 5)
                                                    }
                                                }
                                            }
                                        } else {
                                            Text("Video") // Placeholder for video thumbnail
                                        }
                                    }
                                }
                            }
                            .padding(.leading)
                            .scrollIndicators(.hidden)
                        }

                        HStack(spacing: 30) {
                            Button {
                                isShowingImagePicker.toggle()

                            } label: {
                                Image(systemName: "photo.on.rectangle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 23, height: 23)
                            }

                            Button {
                                isShowingVideoPicker.toggle()
                            } label: {
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 23, height: 23)
                            }
                        }.padding(.vertical)
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    if let imageData = image.jpegData(compressionQuality: 0.8) {
                        viewModel.mediaData.append(imageData)
                        viewModel.mediaTypes.append("image")
                    }
                }
            }
            .sheet(isPresented: $isShowingVideoPicker) {
                VideoPicker(sourceType: .photoLibrary) { url in
                    if let videoData = try? Data(contentsOf: url) {
                        viewModel.mediaData.append(videoData)
                        viewModel.mediaTypes.append("video")
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

                    }) {
                        Text("Cancel")
                            .foregroundColor(.black)
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    if viewModel.isLoading {
                        ProgressView("Creating thread...")
                    } else {

                        Button {
                            Task {
                                await viewModel.createThread()
                                 if viewModel.sucess {
                                    selectedTab = oldSelectedTav

                                }
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
}

#Preview {
    FeedsCreationView(
        selectedTab: .constant(2), oldSelectedTav: .constant(3)
    )
}
