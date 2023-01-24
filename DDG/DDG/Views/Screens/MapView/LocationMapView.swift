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
    
    var body: some View {
        ZStack {
            
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: locationManager.locations) { location in
                MapMarker(coordinate: location.location.coordinate, tint: .brandPrimary)
            }
            .accentColor(.grubRed)
            .ignoresSafeArea()
            VStack {
                LogoView(width: 70).shadow(radius: 1.0)
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isShowingOnBoardView, onDismiss: viewModel.checkInLocationServicesIsEnabled) {
            OnboardView(isShowingOnBoardView: $viewModel.isShowingOnBoardView)
    }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
       // .alert(item: $viewModel.alertItem) {$0.alert}
        
        .onAppear {
            //like onViewDidLoad
            viewModel.runStartupChecks()
            if locationManager.locations.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
            
            
        }

                         

    }
}

private func checkRegistration() -> Bool {
    
    return true
}
struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView().environmentObject(LocationManager())
    }
}


//34.1808° N, 118.3090° W


