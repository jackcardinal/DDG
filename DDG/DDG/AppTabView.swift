//
//  AppTabView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
        
            LocationMapView()
                .tabItem { Label("Map", systemImage: "map")}
            
            LocationListView()
                .tabItem { Label("Locations", systemImage: "building")}
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person")}
        }
        .accentColor(.brandPrimary)
    }
    
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
