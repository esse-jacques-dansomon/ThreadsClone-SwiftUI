//
//  ThreadItemView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ThreadItemView: View {

    let thread: Thread

    var body: some View {
        VStack {
            HStack (alignment: .top){
                
                HStack (alignment: .top){
                   
                    ThreadsCircleImage(user: thread.user)

                    VStack (alignment:.leading, spacing: 5) {
                        Text(thread.user?.username ?? "")
                        Text(thread.caption)
                            .font(.footnote)
                         
                        HStack {
                            Button {
                                
                            }label: {
                                 Image(systemName: "heart")
                                
                            }
                            
                            Button {
                                
                            }label: {
                                 Image(systemName: "bubble.right")
                            }
                            
                            Button {
                                
                            }label: {
                                 Image(systemName: "arrow.rectanglepath")
                            }
                            
                            Button {
                                
                            }label: {
                                 Image(systemName: "paperplane")
                            }
                        }
                        .padding(.vertical)
                        .foregroundColor(.black)
                        
                    
                    }
                }
                
                Spacer()
              
                //
                HStack {
                    Text("10min")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    Button {
                        
                    }label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                    }
                  
                }
                
            }.padding(.top)
            Divider()
        }
    }
}


struct ThreadItemView_preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ThreadItemView(thread: dev.thread)
        }
    }
}
