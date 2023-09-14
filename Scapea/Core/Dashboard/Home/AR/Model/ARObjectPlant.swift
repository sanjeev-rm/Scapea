//
//  ARObjectPlant.swift
//  Scapea
//
//  Created by Sanjeev RM on 15/09/23.
//

import Foundation
import SwiftUI

enum ARObjectPlant: CaseIterable {
    case tulip
    
    var image: Image {
        switch self {
        case .tulip: return Image(scapeaImage: .arObjectPlantTulipImage)
        }
    }
}
