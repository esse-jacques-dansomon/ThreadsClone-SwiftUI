//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import SwiftUI

struct UserContentListView: View {
    @State var selectedTabView  = ProfileThreadsFilter.Threads
    @Namespace var animation;

    @StateObject var viewModel : UserContentViewModel

    init(user: User ){
        self._viewModel = StateObject(wrappedValue: UserContentViewModel(user: user))
    }

    var body: some View {
        VStack {
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
                ForEach(viewModel.threads, id: \.self) { thread in
                    ThreadItemView(thread: thread)
                }
            }
        }
    }
}




struct UserContentListView_preview: PreviewProvider {
    static var previews: some View {
        UserContentListView(user: dev.user)
    }
}

