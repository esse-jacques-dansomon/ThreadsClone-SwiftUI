//
//  ThreadsCircleImage.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 31/05/2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge

    var dismesion: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct ThreadsCircleImage: View {
    var user: User?
    var size: ProfileImageSize

    init(user: User?, size: ProfileImageSize = .xSmall) {
        self.user = user
        self.size = size
    }
    var body: some View {
        if let imageUrl =  user?.profileImageUrl {
            KFImage(
               URL(string: imageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: size.dismesion, height: size.dismesion)
            .clipShape(Circle())

        }else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dismesion, height: size.dismesion)
                .foregroundColor(Color(.systemGray4))
                .clipShape(Circle())
        }


    }
}


struct ThreadsCircleImage_preview: PreviewProvider {
    static var previews: some View {
        ThreadsCircleImage(user: dev.user )
    }
}
