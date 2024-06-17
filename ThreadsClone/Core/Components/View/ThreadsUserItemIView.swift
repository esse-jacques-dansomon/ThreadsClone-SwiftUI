//
//  ThreadsUserItemIView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI

struct ThreadsUserItemIView: View {
    let user: User

    var body: some View {
        HStack (alignment: .center) {
            ThreadsCircleImage(user: user)

            VStack (alignment: .leading) {
                HStack {
                    Text(user.username.trimmingCharacters(in: .whitespacesAndNewlines))
                    Spacer()
                }
                Text(user.fullname.trimmingCharacters(in: .whitespacesAndNewlines))
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

struct UserCell_Preview: PreviewProvider {
    static var previews: some View {
        ThreadsUserItemIView(user: dev.user)
    }
}
