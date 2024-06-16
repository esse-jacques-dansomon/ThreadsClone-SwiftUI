//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct EditProfileView: View {
    @State var link : String = ""
    @State var toogle : Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                VStack (alignment: .leading){
                    HStack (alignment: .top){
                        VStack (alignment: .leading) {
                            VStack (alignment: .leading){
                                Text("Name").bold()
                                Text("Esse Jacques")
                            }
                            Divider()
                        }

                        Spacer()
                        ThreadsCircleImage()
                    }


                    VStack (alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)

                        Text("Follow these steps to set some of the preferences you’ll find useful.")
                            .font(.footnote)
                    }
                    Divider()

                    VStack (alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Add Link ...",text: $link, axis: .vertical)
                    }

                    Divider()
                    Toggle("Provate profile", isOn: $toogle)

                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                } .padding()

            }
            .navigationTitle("Edit profile")
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
                        Text("Done")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
