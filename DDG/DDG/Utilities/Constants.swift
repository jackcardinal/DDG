//
//  Constants.swift
//  DDG
//
//  Created by Jack Cardinal on 10/18/22.
//

import UIKit


enum RecordType {
    static let location = "DDGLocation"
    static let profile  = "DDGProfile"
}

enum PlaceholderImage {
    static let avatar = UIImage(named: "default-avatar")!
    static let square = UIImage(named: "default-square-asset")!
    static let banner = UIImage(named: "default-banner-asset")!
}

enum ImageDimension {
    case square, banner
    
    static func getPlaceholder(for dimension: ImageDimension) -> UIImage {
        
        switch dimension {
        case .banner:
            return PlaceholderImage.banner
        case .square:
            return PlaceholderImage.square
        }
       // return dimension == .square ? PlaceholderImage.square : PlaceholderImage.banner
    }
}
