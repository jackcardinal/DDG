//
//  DDGLocation.swift
//  DDG
//
//  Created by Jack Cardinal on 10/17/22.
//

import CloudKit
import UIKit
//import MapKit
//import SwiftUI


struct DDGLocation: Identifiable {
    static let kName        = "name"
    static let kDescription = "description"
    static let kSquareAsset = "squareAsset"
    static let kBquareAsset = "bannerAsset"
    static let kAddress     = "address"
    static let kLocation    = "location"
    static let kWebsiteURL  = "websiteURL"
    static let kPhoneNumber = "phoneNumber"

    let id: CKRecord.ID
    let name: String
    let description: String
    let squareAsset: CKAsset!
    let bannerAsset: CKAsset!
    let address: String
    let location: CLLocation
    let websiteURL: String
    let phoneNumber: String
    
    init(record: CKRecord) {
        id          = record.recordID
        name        = record[DDGLocation.kName] as? String ?? "N/A"
        description = record[DDGLocation.kDescription] as? String ?? "N/A"
        squareAsset = record[DDGLocation.kSquareAsset] as? CKAsset
        bannerAsset = record[DDGLocation.kBquareAsset] as? CKAsset
        address     = record[DDGLocation.kAddress] as? String ?? "N/A"
        location    = record[DDGLocation.kLocation] as? CLLocation ?? CLLocation(latitude: 34.134026, longitude: -118.288345)
        websiteURL  = record[DDGLocation.kWebsiteURL] as? String ?? "N/A"
        phoneNumber = record[DDGLocation.kPhoneNumber] as? String ?? "N/A"

    }
    
    func createSquareImage() -> UIImage {
        guard let asset = squareAsset else { return PlaceholderImage.square }
        return asset.convertToUIImage(in: .square)
    }
    
    func createBannerImage() -> UIImage {
        guard let asset = bannerAsset else { return PlaceholderImage.banner }
        return asset.convertToUIImage(in: .banner)
    }
}

//34.134026, -118.288345
