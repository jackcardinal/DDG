//
//  ProfileViewModel.swift
//  DDG
//
//  Created by Jack Cardinal on 1/12/23.
//

import SwiftUI
import CloudKit
import UIKit

final class ProfileViewModel: ObservableObject  {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var tagline = ""
    @Published var bioText = "This is a sample bio"
    @Published var avatar = PlaceholderImage.avatar
    @Published var isShowingPhotoPicker = false
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    
    func isValidProfile() -> Bool {
        
        guard !firstName.isEmpty,
              !lastName.isEmpty,
              !tagline.isEmpty,
              !bioText.isEmpty,
              bioText.count <= 100,
              avatar != PlaceholderImage.avatar else { return false }
        return true
    }
    
    func createProfile() {
        guard isValidProfile() else {
            alertItem = AlertContext.invalidProfile
            return
        }
        
        let profileRecord = createProfileRecord()
        
        guard let userRecord = CloudKitManager.shared.userRecord else {
            alertItem = AlertContext.noUserRecord
            return
        }
        
        userRecord["userProfile"] = CKRecord.Reference(recordID: profileRecord.recordID, action: .none)
        
        showLoadingView()
        CloudKitManager.shared.batchSave(records: [userRecord, profileRecord]) { result in
            DispatchQueue.main.async { [self] in
                hideLoadingView()

                switch result {
                case .success(_):
                    alertItem = AlertContext.createProfileSuccess
                case .failure(_):
                    alertItem = AlertContext.createProfileFailure
                }
            }
        }
    }
        
//        // Get UserRecordID from the Container
//        CKContainer.default().fetchUserRecordID { recordID, error in
//            guard let recordID = recordID, error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//
//
//            // Get UserRecord from the Public Database
//            CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { userRecord, error in
//                guard let userRecord = userRecord, error == nil else {
//                    print(error!.localizedDescription)
//                    return
//                }
                
                // Create a reference on UserRecord to the DDGProfile we created.
//                userRecord["userProfile"] = CKRecord.Reference(recordID: profileRecord.recordID, action: .none)
//
//                // Create a CKOperation to save our User and Profile Records (batch save)
//                let operation = CKModifyRecordsOperation(recordsToSave: [userRecord, profileRecord])
//                operation.modifyRecordsCompletionBlock = { savedRecords, _, error in
//
//                    guard let savedRecords = savedRecords, error == nil else {
//                        print(error!.localizedDescription)
//                        return
//                    }
//                    print(savedRecords)
//                }
//
//                CKContainer.default().publicCloudDatabase.add(operation)
//
//
//        }

//}
    
    func getProfile() {
        
        guard let userRecord = CloudKitManager.shared.userRecord else {
            alertItem = AlertContext.noUserRecord
              return
        }
        
        guard let profileReference = userRecord["userProfile"] as? CKRecord.Reference else { return }
        showLoadingView()
        let profileRecordID = profileReference.recordID
        
//        CKContainer.default().publicCloudDatabase.fetch(withRecordID: profileRecordID) { profileRecord, error in
//            guard let profileRecord = profileRecord, error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
       CloudKitManager.shared.fetchRecord(with: profileRecordID) { result in
           DispatchQueue.main.async { [self] in
               switch result {
               case .success(let record):
                   let profile = DDGProfile(record: record)
                   firstName = profile.firstName
                   lastName = profile.lastName
                   tagline = profile.companyName
                   bioText = profile.bio
                   avatar = profile.createAvatarImage()
                   break
               case .failure(_):
                   alertItem = AlertContext.getProfileFailure
                   break
               }
               hideLoadingView()
           } 
       }
    

    }
        
                
//        CKContainer.default().fetchUserRecordID { recordID, error in
//            guard let recordID = recordID, error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//
//            // Get UserRecord from the Public Database
//            CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { userRecord, error in
//                guard let userRecord = userRecord, error == nil else {
//                    print(error!.localizedDescription)
//                    return
//                }
//
//                let profileReference = userRecord["userProfile"] as! CKRecord.Reference
//                let profileRecordID = profileReference.recordID
//
//                CKContainer.default().publicCloudDatabase.fetch(withRecordID: profileRecordID) { profileRecord, error in
//                    guard let profileRecord = profileRecord, error == nil else {
//                        print(error!.localizedDescription)
//                        return
//                    }
//
//                    DispatchQueue.main.async { [self] in
//                        let profile = DDGProfile(record: profileRecord)
//                        firstName = profile.firstName
//                        lastName = profile.lastName
//                        tagline = profile.companyName
//                        bioText = profile.bio
//                        avatar = profile.createAvatarImage()
//                    }
//                }
//            }
//        }
 //   }
    
    private func createProfileRecord() -> CKRecord {
        // Create CKRecord from ProfileView and send it to cloudKit
        let profileRecord = CKRecord(recordType: RecordType.profile)
        profileRecord[DDGProfile.kFirstName] = firstName
        profileRecord[DDGProfile.kLastName] = lastName
        profileRecord[DDGProfile.kBio] = bioText
        profileRecord[DDGProfile.kCompanyName] = tagline
        profileRecord[DDGProfile.kAvatar] = avatar.convertToCKAsset()
        return profileRecord
    }
    
    private func showLoadingView() { isLoading = true }
    private func hideLoadingView() { isLoading = false }
}
