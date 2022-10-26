//
//  LocationMapViewModel.swift
//  DDG
//
//  Created by Jack Cardinal on 10/25/22.
//

import SwiftUI
import CloudKit
import MapKit

@MainActor final class LocationMapViewModel: ObservableObject {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.180840, longitude: -118.308968), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    @Published var isShowingDetailView = false
    
    var selectedLocation: DDGLocation? {
        didSet { isShowingDetailView = true}
    }
    
    func getLocations(for locationManager: LocationManager) {
        CloudKitManager.getLocations { [self] result in
            switch result {
                case .success(let locations):
                locationManager.locations = locations
                print(locations.count)
                case .failure(_):
                alertItem = AlertContext.unableToGetLocations
            }
        }
    }
}

//CloudKitManager.getLocations { result in
//    switch result {
//        case .success(let locations):
//         // locations = locations
//        print(locations.count)
//        case .failure(_):
//        viewModel.alertItem = AlertContext.unableToGetLocations
//    }
//}
