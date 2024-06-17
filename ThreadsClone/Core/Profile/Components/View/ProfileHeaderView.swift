//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 17/06/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user : User

    var body: some View {
            //Menus
            HStack (alignment:.top) {
                VStack (alignment: .leading) {
                    Text(user.fullname)
                        .font(.title)
                        .bold()
                    Text(user.username)

                    if let bio = user.bio {
                        Text(bio)
                            .font(.subheadline)
                            .padding(.top, 5)
                    }

                }
                Spacer()
                ThreadsCircleImage(user: user)
            }
            //User infos
            VStack(alignment: .leading, spacing: 4) {
                Text("36 followers . Jacques-dansomon.com")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
    }
}


struct CProfileHeaderView_preview: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user )
    }
}
