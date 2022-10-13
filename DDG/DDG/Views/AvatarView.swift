//
//  AvatarView.swift
//  DDG
//
//  Created by Jack Cardinal on 10/12/22.
//

import SwiftUI

struct AvatarView: View {
    let size: CGFloat
    
    var body: some View {
        Image("default-avatar")
            .resizable()
            .scaledToFit()
            .frame(width: size)
            .clipShape(Circle())
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(size: 70.0)
    }
}
