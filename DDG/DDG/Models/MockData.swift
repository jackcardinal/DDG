//
//  MockData.swift
//  DDG
//
//  Created by Jack Cardinal on 10/18/22.
//

import CloudKit

struct MockData {
    
    static var location: CKRecord {
        let record = CKRecord(recordType: RecordType.location)
        record[DDGLocation.kName] = "Roadway Tavern"
        record[DDGLocation.kAddress] = "100 Pinkerton Run Road"
        record[DDGLocation.kDescription] = "This is the tavern where Mit and Ed tended bar. This is more information about the tavern. This is a long description."
        record[DDGLocation.kWebsiteURL] = "https://nytimes.com"
        record[DDGLocation.kPhoneNumber] = "213-500-4089"
        record[DDGLocation.kLocation] = CLLocation(latitude: -34.180840, longitude: -118.308968)
        return record
    }
    
}
