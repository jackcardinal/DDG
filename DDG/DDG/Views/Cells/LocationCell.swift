//
//  LocationCell.swift
//  DDG
//
//  Created by Jack Cardinal on 8/22/22.
//

import SwiftUI


struct LocationCell: View {
    
    let location: DDGLocation

    var body: some View {
        HStack {
            LocationImage(image: location.createSquareImage())
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding(-2)
                    .minimumScaleFactor(0.75)
                HStack {
                    ForEach(0..<4) { item in
                        AvatarView(image: PlaceholderImage.avatar, size: 30.0)
                    }
                }
            }
            .padding(.leading, 5)
        }
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell(location: DDGLocation(record: MockData.location))
    }
}

struct LocationImage: View {
    let image: UIImage
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 80)
            .clipShape(Circle())
    }
}


