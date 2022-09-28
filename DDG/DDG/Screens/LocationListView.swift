//
//  LocationListView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI


struct LocationListView: View {
    
    let grubSpots = MockData.grubSpots
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(grubSpots) { spot in
                    LocationListViewCell(grubSpot: spot)
                        .listRowSeparator(.hidden)
                        .padding(.vertical, 8)
                        .onTapGesture {
                            print(spot.name)
                        }
                }
                .navigationTitle("Grub Spots")
                .listStyle(.plain)
            }
            
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
