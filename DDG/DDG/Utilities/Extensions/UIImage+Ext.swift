//
//  UIImage+Ext.swift
//  DDG
//
//  Created by Jack Cardinal on 12/13/22.
//

import CloudKit
import UIKit

extension UIImage {
    
    func convertToCKAsset() -> CKAsset? {
        
        // get our app base document directory URL
        guard let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Error. Could not find baseURL")
            return nil
        }
        
        // append some unique idetifier for our profile image
        let fileURL = urlPath.appendingPathComponent("selectedAvatarImage")
        
        // write the image data to the location the addess points to
        guard let imageData = jpegData(compressionQuality: 0.25) else {
            print("Error. Could not compress image")
            return nil
        }
        // create our CKAsset with that fileURL
        do {
            try imageData.write(to: fileURL)
            return CKAsset(fileURL: fileURL)
        } catch {
            print("Error. Could not write image")
            return nil
        }
    }
        
}

