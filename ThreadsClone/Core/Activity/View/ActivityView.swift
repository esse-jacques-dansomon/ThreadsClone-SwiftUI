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
            VStack(alignment: .leading)  {

                    ScrollView(.horizontal) {
                        HStack {
                            Text("Activity")
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            ForEach(1...10, id: \.self){ item in
                                Text("Text")
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(.black)
                                    .cornerRadius(20)

                            }
                        }
                    }.padding()




                ScrollView{
                    ThreadsUserItemIView()
                    LazyVStack( alignment: .leading){
                        ForEach(1...10, id: \.self){ item in
                            ThreadItemView()
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
