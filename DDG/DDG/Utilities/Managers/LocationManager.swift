//
//  LocationManager.swift
//  DDG
//
//  Created by Jack Cardinal on 10/25/22.
//

import Foundation


final class LocationManager: ObservableObject {
    
    @Published var locations: [DDGLocation] = []
    
}
