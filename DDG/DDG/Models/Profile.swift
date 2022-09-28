//
//  Profile.swift
//  DDG
//
//  Created by Jack Cardinal on 8/22/22.
//

import Foundation

struct Profile: Codable, Identifiable {
    var id = UUID()
    let name: String
    let imageURL: String
}
