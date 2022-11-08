//
//  LocationListView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI


struct LocationListView: View {
    
    @EnvironmentObject private var locationManager: LocationManager
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(locationManager.locations) { location in
                    NavigationLink(destination: LocationDetailView(location: location)) {
                        LocationCell(location: location)
 
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
        LocationListView().environmentObject(LocationManager())
    }
}
