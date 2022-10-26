//
//  LocationMapView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI
import MapKit


struct LocationMapView: View {
    
    @StateObject private var viewModel = LocationMapViewModel()
    @EnvironmentObject private var locationManager: LocationManager

    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region)
                .ignoresSafeArea()
            VStack {
                LogoView().shadow(radius: 1.0)
                Spacer()
            }
        }
//        .alert(item: $alertItem, content: { alertItem in
//            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
//        })
        .alert(item: $viewModel.alertItem) {$0.alert}
        .onAppear {
            viewModel.getLocations(for: locationManager)
        }
    }
}

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
