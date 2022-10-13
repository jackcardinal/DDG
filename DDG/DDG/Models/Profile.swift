//
//  Profile.swift
//  DDG
//
//  Created by Jack Cardinal on 8/22/22.
//

import Foundation

struct Profile: Codable, Identifiable {
    var id = UUID()
    let firstName: String
    let lastName: String
    let bio: String
    let imageURL: String
}
