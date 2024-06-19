//
//  EmptyContentView.swift
//  ThreadsClone
//
//  Created by Esse Jacques  on 19/06/2024.
//

import SwiftUI

struct EmptyContentView: View {
    var text : String = "No Content"
    var body: some View {
        VStack{
            Spacer()
            Text(text)
            Spacer()
        }
    }
}

#Preview {
    EmptyContentView()
}
