//
//  ProfileView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI

struct ProfileView: View {
    
    let grubSpot: GrubSpot
    
    var body: some View {
        HStack {
            Image("default-avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 70)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("This is a sample name")
                    .font(.title2).bold()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(grubSpot: MockData.sampleGrubspot)
    }
}
