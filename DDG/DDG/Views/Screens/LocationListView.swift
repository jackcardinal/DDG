//
//  LocationListView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI


struct LocationListView: View {
    
    @State private var locations: [DDGLocation] = [DDGLocation(record: MockData.location)]
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(locations, id: \.ckRecordID) { location in
                    NavigationLink(destination: LocationDetailView(location: location)) {
                        LocationCell(location: location)
                            .listRowSeparator(.hidden)
                            .padding(.vertical, 8)
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
