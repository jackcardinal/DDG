//
//  CloudKitManager.swift
//  DDG
//
//  Created by Jack Cardinal on 10/18/22.
//

import CloudKit


final class CloudKitManager {
    
    static let shared = CloudKitManager()
    
    private init() {}
    
    var userRecord: CKRecord?
    
    func getRecord() {
        CKContainer.default().fetchUserRecordID { recordID, error in
            guard let recordID = recordID, error == nil else {
                print(error!.localizedDescription)
                return
            }
            CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { userRecord, error in
                guard let userRecord = userRecord, error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                self.userRecord = userRecord
                print(userRecord)
            }
        }
    }
    
    func getLocations(completed: @escaping (Result<[DDGLocation], Error>) -> Void) {
        let sortDescriptor = NSSortDescriptor(key: DDGLocation.kName, ascending: true)
        let query = CKQuery(recordType:RecordType.location, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortDescriptor]
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                completed(.failure(error!))
                return

            }
            
            guard let records = records else { return }
            
           // let locations = records.map(DDGLocation.init)
            let locations = records.map {$0.convertToDDGLocation() }

            
//            for record in records {
//                let location = DDGLocation(record: record)
//                locations.append(location)
//            }
//
            completed(.success(locations))

        }
        
    }
    
    func batchSave(records: [CKRecord], completed: @escaping(Result<[CKRecord], Error>) -> Void) {
        
        let operation = CKModifyRecordsOperation(recordsToSave: records)
        
        operation.modifyRecordsCompletionBlock = { savedRecords, _, error in
            guard let savedRecords = savedRecords, error == nil else {
                completed(.failure(error!))
                return
            }
            completed(.success(savedRecords))
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
        
    }
    
    func fetchRecord(with id: CKRecord.ID, completed: @escaping(Result<CKRecord, Error>) -> Void) {
        
        CKContainer.default().publicCloudDatabase.fetch(withRecordID: id) { record, error in
            guard let record = record, error == nil else {
                completed(.failure(error!))
                return
            }
            completed(.success(record))
        }
    }
}
