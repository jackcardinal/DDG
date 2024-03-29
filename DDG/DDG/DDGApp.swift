//
//  DDGApp.swift
//  DDG
//
//  Created by Jack Cardinal on 8/18/22.
//

import SwiftUI

@main
struct DDGApp: App {
    
    var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            AppTabView().environmentObject(locationManager)
        }
    }
}
