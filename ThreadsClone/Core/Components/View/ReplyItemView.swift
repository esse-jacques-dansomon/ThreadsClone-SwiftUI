//
//  ReplyItem.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 19/06/2024.
//

import SwiftUI

struct ReplyItemView: View {
    var reply: Reply
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                HStack(alignment: .top) {
                    ThreadsCircleImage(user: reply.user)

                    VStack(alignment: .leading, spacing: 5) {
                        Text(reply.user?.username ?? "No User")
                        Text(reply.caption)
                            .multilineTextAlignment(.leading)
                            .font(.footnote)
                    }
                    Spacer()
                }

                Spacer()

                //
                HStack {
                    Text(reply.timestamp.timestampString())
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    Button {} label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Theme.textColor)
                    }
                }

            }.padding(.top, 2)
           
        }
    }
}

struct ReplyItemView_preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReplyItemView(reply: dev.reply )
        }
    }
}
