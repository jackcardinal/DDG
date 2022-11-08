//
//  CKRecord+Ext.swift
//  DDG
//
//  Created by Jack Cardinal on 10/26/22.
//

import CloudKit

extension CKRecord {
    func convertToDDGLocation() -> DDGLocation { DDGLocation(record: self) }
    func convertToDDGProfile() -> DDGProfile { DDGProfile(record: self) }
}
