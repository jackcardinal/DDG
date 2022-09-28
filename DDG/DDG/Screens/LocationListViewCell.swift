//
//  LocationListViewCell.swift
//  DDG
//
//  Created by Jack Cardinal on 8/22/22.
//

import SwiftUI


struct LocationListViewCell: View {
    
    let grubSpot: GrubSpot

    var body: some View {
        HStack {
            LocationImage()
            VStack(alignment: .leading) {
                Text("Burbank Terrace")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding(-2)
                HStack {
                    ForEach(MockData.sampleGrubspot.checkIns) { checkIn in
                        AvatarView(size: 30.0)
                    }
                }
                
            }
            .padding(.leading, 5)
        }
    }
}

struct LocationListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationListViewCell(grubSpot: MockData.sampleGrubspot)
    }
}

struct LocationImage: View {
    var body: some View {
        Image("burbank-terrace")
            .resizable()
            .scaledToFit()
            .frame(width: 80)
            .clipShape(Circle())
    }
}

struct AvatarView: View {
    var size: CGFloat
    
    var body: some View {
        Image("default-avatar")
            .resizable()
            .scaledToFit()
            .frame(width: size)
            .clipShape(Circle())
    }
}
