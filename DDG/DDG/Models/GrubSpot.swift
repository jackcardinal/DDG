//
//  GrubSpot.swift
//  DDG
//
//  Created by Jack Cardinal on 8/22/22.
//

import Foundation
import CoreLocation


struct GrubSpot: Decodable, Identifiable {
    let id: UUID
    let name: String
    let latitude: Double
    let longitude: Double
    let imageURL: String
    let checkIns: [Profile]
}


struct MockData {
    
    static let sampleProfile = Profile (name: "Sample Name", imageURL: "default-avatar")
    static let sampleProfile1 = Profile (name: "Sample Name", imageURL: "default-avatar")
    static let sampleProfile2 = Profile (name: "Sample Name", imageURL: "default-avatar")

    
    static let sampleGrubspot = GrubSpot(id: UUID(), name: "sampleGrubspot", latitude: 1.0, longitude: 1.0, imageURL: "burbank-terrace", checkIns: [sampleProfile, sampleProfile1, sampleProfile2])
    static let sampleGrubspot1 = GrubSpot(id: UUID(), name: "sampleGrubspot", latitude: 1.0, longitude: 1.0, imageURL: "burbank-terrace", checkIns: [sampleProfile, sampleProfile1, sampleProfile2])
    static let sampleGrubspot2 = GrubSpot(id: UUID(), name: "sampleGrubspot", latitude: 1.0, longitude: 1.0, imageURL: "burbank-terrace", checkIns: [sampleProfile, sampleProfile1, sampleProfile2])
    static let sampleGrubspot3 = GrubSpot(id: UUID(), name: "sampleGrubspot", latitude: 1.0, longitude: 1.0, imageURL: "burbank-terrace", checkIns: [sampleProfile, sampleProfile1, sampleProfile2])


    
    static let grubSpots = [sampleGrubspot, sampleGrubspot1, sampleGrubspot2, sampleGrubspot3]

}
