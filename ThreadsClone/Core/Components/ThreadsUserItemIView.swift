//
//  ThreadsUserItemIView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ThreadsUserItemIView: View {
    var body: some View {
        HStack (alignment: .center) {
            ThreadsCircleImage()
            
            VStack {
                Text("essejacques")
                Text("Esse jacques")
            }
            
            Spacer()
            
            Button {
                
            }label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 32)
        
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal)
    }
}

#Preview {
    ThreadsUserItemIView()
}
