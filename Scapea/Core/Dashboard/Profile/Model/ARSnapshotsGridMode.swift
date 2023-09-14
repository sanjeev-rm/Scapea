//
//  ARSnapshotsGridMode.swift
//  Scapea
//
//  Created by Sanjeev RM on 13/09/23.
//

import Foundation
import SwiftUI

enum ARSnapshotsGridMode {
    case big
    case medium
    case small
    
    var buttonImage: Image {
        switch self {
        case .big: return Image(systemName: "rectangle.grid.1x2.fill")
        case .medium: return Image(systemName: "rectangle.grid.2x2.fill")
        case .small: return Image(systemName: "square.grid.3x2.fill")
        }
    }
    
    var width: CGFloat {
        switch self {
        case .big: return 300
        case .medium: return 160
        case .small: return 100
        }
    }
    
    var height: CGFloat {
        switch self {
        case .big: return 250
        case .medium: return 150
        case .small: return 100
        }
    }
}
