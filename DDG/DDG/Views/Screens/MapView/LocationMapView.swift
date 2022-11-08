//
//  LocationMapView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI
import MapKit


struct LocationMapView: View {
    @EnvironmentObject private var locationManager: LocationManager
    @StateObject private var viewModel = LocationMapViewModel()
    @State var isNotRegistered = true
    
    var body: some View {
        ZStack {
            
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: locationManager.locations) { location in
                MapMarker(coordinate: location.location.coordinate, tint: .brandPrimary)
            }
            .accentColor(.grubRed)
            .ignoresSafeArea()
            VStack {
                LogoView().shadow(radius: 1.0)
                Spacer()
            }
        }
        .sheet(isPresented: $isNotRegistered, content: {
            OnboardView()
        })
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
       // .alert(item: $viewModel.alertItem) {$0.alert}
        
        .onAppear {
            //like onViewDidLoad
            viewModel.checkInLocationServicesIsEnabled()
            if locationManager.locations.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
            
            
        }

                         

    }
}

//private func checkRegistration() -> Bool {
//    
//   // open func bool(forKey defaultName: String) -> Bool
//    
//    if UserDefaults.bool(forKey, defaultName: "kReg") != nil {
//        
//    }
//    
//    guard (UserDefaults.bool(forKey defaultName: "kReg") != nil) else {
//        return false
//    }
//    return true
//}
struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}


//34.1808° N, 118.3090° W

struct LogoView: View {
    var body: some View {
        Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(height: 70.0)
    }
}
