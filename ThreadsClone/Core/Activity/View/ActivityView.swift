//
//  ActivityView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ActivityView: View {
    @State var isFixed = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Activity")
                        .font(.title)
                        .bold()
                    Spacer()
                }.padding(.horizontal)
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(1...10, id: \.self) { _ in
                            Text("Text")
                                .frame(width: 100, height: 40)
                                .foregroundStyle(.white)
                                .background(.black)
                                .cornerRadius(9)
                        }
                    }
                }.scrollIndicators(.hidden)
                    .padding(.horizontal, 10)

                ScrollView {
                    // ThreadsUserItemIView()
                    LazyVStack(alignment: .leading) {
                        ForEach(1...10, id: \.self) { _ in
                            // ThreadItemView()
                        }
                    }.padding()
                }

                Spacer()
            }
        }
    }
}

#Preview {
    ActivityView()
}
