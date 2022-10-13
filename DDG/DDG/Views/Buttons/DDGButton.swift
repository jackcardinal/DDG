//
//  DDGButton.swift
//  DDG
//
//  Created by Jack Cardinal on 10/12/22.
//

import SwiftUI

struct DDGButton: View {
    
    let btnText: String
    var body: some View {

        Text(btnText)
            .bold()
            .frame(width: 280, height: 44)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(8)

    }
}

struct DDGButton_Previews: PreviewProvider {
    static var previews: some View {
        DDGButton(btnText: "Create Profile")
    }
}
