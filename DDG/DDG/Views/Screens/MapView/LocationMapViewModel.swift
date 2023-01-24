//
//  LocationMapViewModel.swift
//  DDG
//
//  Created by Jack Cardinal on 10/25/22.
//

import SwiftUI
import CloudKit
import MapKit

final class LocationMapViewModel: NSObject, ObservableObject {
    
    @Published var isShowingOnBoardView = false

    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @Published var alertItem: AlertItem?

    var deviceLocationManager: CLLocationManager?
    let kHasSeenOnboardView = "hasSeenOnboardView"
    var hasSeenOnboardView: Bool {
        return UserDefaults.standard.bool(forKey: kHasSeenOnboardView)
    }
    func runStartupChecks() {
        if !hasSeenOnboardView {
            isShowingOnBoardView = true
            UserDefaults.standard.set(true, forKey: kHasSeenOnboardView)
        } else {
            checkInLocationServicesIsEnabled()
        }
    }
    
    func checkInLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            deviceLocationManager = CLLocationManager()
            deviceLocationManager!.delegate = self
            //checkLocationAuthoization() this is redundant on inti
        } else {
            alertItem = AlertContext.locationRestricted
        }
    }
    
    private func checkLocationAuthoization() {
        guard let deviceLocationManager = deviceLocationManager else { return }
        switch deviceLocationManager.authorizationStatus {
        case .notDetermined:
            deviceLocationManager.requestWhenInUseAuthorization()
        case .restricted:
            self.alertItem = AlertContext.locationRestricted
        case .denied:
            self.alertItem = AlertContext.locationDenied
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    func getLocations(for locationManager: LocationManager) {
        CloudKitManager.shared.getLocations { [self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let locations):
                        locationManager.locations = locations
                    //print(locations)
                    case .failure(_):
                        self.alertItem = AlertContext.unableToGetLocations
                }
            }
        }
    }
}

//this fires once on init
extension LocationMapViewModel: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthoization()
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
