//
//  Storage.swift
//  Scapea
//
//  Created by Sanjeev RM on 13/09/23.
//

import Foundation
import SwiftUI

class Storage {
    
    enum Key: String {
        case arSnapshots = "arSnapshots"
    }
    
    @AppStorage(Key.arSnapshots.rawValue) static var arSnapshots: Data = Data()
    
    static func addARSnapShot(imageData: Data?) {
        guard let newImageData = imageData else { return }

        var storedARSnapshots = getARSnapshots()
        storedARSnapshots.snapshots.append(Snapshot(image: newImageData))

        if let updatedARSnapshotsData = try? JSONEncoder().encode(storedARSnapshots) {
            arSnapshots = updatedARSnapshotsData
        } else {
            print("DEBUG: Unable to convert updated AR snapshots")
        }
    }
    
    static func getARSnapshots() -> ARSnapshots {
        if let storedARSnapshots = try? JSONDecoder().decode(ARSnapshots.self, from: arSnapshots) {
            return storedARSnapshots
        }
        return ARSnapshots(snapshots: [])
    }
    
    static func deleteSnapshot(_ toDeleteSnapshot: Snapshot) {
        print("DEBUG: Delete function called")
        
        var storedARSnapshots = getARSnapshots()
        storedARSnapshots.snapshots.removeAll { snapshot in
            print("DEBUG: Deleted Snapshot")
            return snapshot.id == toDeleteSnapshot.id
        }
        
        if let updatedARSnapshotsData = try? JSONEncoder().encode(storedARSnapshots) {
            arSnapshots = updatedARSnapshotsData
        } else {
            print("DEBUG: Unable to convert updated AR snapshots")
        }
    }
}
