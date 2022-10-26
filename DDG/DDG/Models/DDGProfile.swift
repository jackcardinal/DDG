//
//  DDGProfile.swift
//  DDG
//
//  Created by Jack Cardinal on 10/18/22.
//

import CloudKit

struct DDGProfile {
    
    static let kAvatar = "avatar"
    static let kBio = "bio"
    static let kCompanyName = "companyName"
    static let kFirstName = "firstName"
    static let kIsCheckedIn = "isCheckedIn"
    static let kLastName = "lastName"
    
    
    let ckRecordID: CKRecord.ID
    let avatar: CKAsset!
    let bio: String
    let companyName: String
    let firstName: String
    let isCheckedIn: CKRecord.Reference? = nil
    let lastName: String
    
    
    init(record: CKRecord) {
        ckRecordID      = record.recordID
        avatar          = record[DDGProfile.kAvatar] as? CKAsset
        bio             = record[DDGProfile.kBio] as? String ?? "N/A"
        companyName     = record[DDGProfile.kCompanyName] as? String ?? "N/A"
        firstName       = record[DDGProfile.kFirstName] as? String ?? "N/A"
        lastName        = record[DDGProfile.kLastName] as? String ?? "N/A"
    }
    
    
    
    
}
