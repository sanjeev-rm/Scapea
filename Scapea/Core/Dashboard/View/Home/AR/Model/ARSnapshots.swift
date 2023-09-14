//
//  ARSnapshot.swift
//  Scapea
//
//  Created by Sanjeev RM on 13/09/23.
//

import Foundation
import SwiftUI

struct ARSnapshots: Codable {
    var snapshots: [Snapshot]
}

struct Snapshot: Identifiable, Codable, Hashable {
    var id = UUID()
    var image: Data
}
