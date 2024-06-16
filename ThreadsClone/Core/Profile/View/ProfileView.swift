//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ProfileView: View {
    @State var selectedTabView  = ProfileThreadsFilter.Threads
    @Namespace var animation;
    var body: some View {
        NavigationStack {
            ScrollView {
                //Buttons
                HStack {
                    Image(systemName: "globe")
                        .font(.title)
                    Spacer()
                    HStack {
                        Image("instagram")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)

                        NavigationLink {
                            ProfileSettingsView()
                                .navigationBarBackButtonHidden()

                        } label: {
                            Image( "menu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        }

                    }
                }.padding(.bottom)
                //User and Menu
                VStack(alignment: .leading, spacing: 12) {
                    //Menus
                    HStack (alignment:.top) {
                        VStack (alignment: .leading) {
                            Text("Esse Jacques")
                                .font(.title)
                                .bold()
                            Text("esse_jacques")
                            Text("Co Founder of @agence.cauris")
                                .font(.subheadline)
                                .padding(.top, 5)
                        }
                        Spacer()
                        ThreadsCircleImage()
                    }
                    //User infos
                    VStack(alignment: .leading, spacing: 4) {
                        Text("36 followers . Jacques-dansomon.com")
                            .foregroundStyle(.gray)
                            .font(.footnote)
                    }

                    ThreadsTextBtnView(title: "Follow")
                        .foregroundColor(.blue)
                }

                //Custom TabView
                HStack {
                    ForEach (ProfileThreadsFilter.allCases){ item in
                        VStack(alignment: .center, spacing: 10) {
                            HStack {
                                Spacer()
                                Text(item.title)
                                Spacer()
                            }.padding(.top)


                            HStack {

                                if (selectedTabView == item) {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(height: 1.5)
                                        .matchedGeometryEffect(id: "ID", in: animation)
                                }else {
                                    Rectangle()
                                        .foregroundColor(Color(.systemGray4))
                                        .frame(height: 1)
                                }


                            }

                        }

                        .onTapGesture {
                            withAnimation(.spring) {
                                selectedTabView = item
                            }
                        }
                    }
                }

                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { _ in
                        ThreadItemView()
                    }
                }
            }

        } 
        .scrollIndicators(  .hidden)
        .padding()
    }
}

#Preview {
    ProfileView()
}
