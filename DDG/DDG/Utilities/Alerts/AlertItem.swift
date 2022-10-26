//
//  Alert.swift
//  DDG
//
//  Created by Jack Cardinal on 10/21/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
    var alert: Alert {
        return Alert(title: title, message: message, dismissButton: dismissButton)
    }
}

struct AlertContext {
    
    //MARK: - Mapview Errors
    
    static let unableToGetLocations =   AlertItem(title: Text("Locations Error"),
                                              message: Text("Unable to get locations at this time. \nPlease try again later."),
                                              dismissButton: .default(Text("Okay")))
    
    
    static let genericError =   AlertItem(title: Text("Error"),
                                              message: Text("Please check your internet connection or try again later."),
                                              dismissButton: .default(Text("Okay")))
}
