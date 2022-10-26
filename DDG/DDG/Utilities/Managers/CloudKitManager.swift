//
//  CloudKitManager.swift
//  DDG
//
//  Created by Jack Cardinal on 10/18/22.
//

import CloudKit


struct CloudKitManager {
    
    static func getLocations(completed: @escaping (Result<[DDGLocation], Error>) -> Void) {
        let sortDescriptor = NSSortDescriptor(key: DDGLocation.kName, ascending: true)
        let query = CKQuery(recordType:RecordType.location, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortDescriptor]
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                completed(.failure(error!))
                return

            }
            
            guard let records = records else { return }
            
            let locations = records.map(DDGLocation.init)
            
//            for record in records {
//                let location = DDGLocation(record: record)
//                locations.append(location)
//            }
//
            completed(.success(locations))

        }
        
    }
    
    
    
}
