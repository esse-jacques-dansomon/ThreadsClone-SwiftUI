//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @StateObject var viewModel = EditProfileViewModel()
    @Environment(\.dismiss) var dismiss

    @State var link: String = ""
    @State var toogle: Bool = false
    let user: User


    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("Name").bold()
                                Text(user.fullname)
                            }
                            Divider()
                        }

                        Spacer()

                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60)
                                    .clipShape(Circle())
                            } else {
                                ThreadsCircleImage(user: user)
                            }
                        }
                    }

                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)

                        Text("Follow these steps to set some of the preferences you’ll find useful.")
                            .font(.footnote)
                    }
                    Divider()

                    VStack(alignment: .leading) {
                        Text("Bio Link")
                            .fontWeight(.semibold)
                        TextField("Add Link ...", text: $link, axis: .vertical)
                    }

                    Divider()
                    Toggle("Provate profile", isOn: $toogle)
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }.padding()
            }
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.black)
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}



struct EditProfileView_preview: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: dev.user)
    }
}
