//
//  LogoView.swift
//  DDG
//
//  Created by Jack Cardinal on 11/8/22.
//

import SwiftUI

struct LogoView: View {
    let width: CGFloat
    var body: some View {
        Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(width: width)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(width: 250)
    }
}
