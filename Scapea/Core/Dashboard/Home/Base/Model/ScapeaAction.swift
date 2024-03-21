//
//  Actions.swift
//  Scapea
//
//  Created by Sanjeev RM on 10/09/23.
//

import Foundation
import SwiftUI

enum ScapeaAction: CaseIterable {
    case ar
    case curatedKits
    case scapedia
    
    var cardView: some View {
        return ActionCardView(action: self)
    }
    
    var title: String {
        switch self {
        case .ar: return "AR"
        case .curatedKits: return "Curated Kits"
        case .scapedia: return "Scapedia"
        }
    }
    
    var description: String {
        switch self {
        case .ar: return "See it, Believe it, Grow it! Explore Your Dream Garden in Reality with Scapea's AR Garden Visualizer."
        case .curatedKits: return "Tailored Gardens, Delivered to Your Doorstep! Discover Perfectly Curated Plant Kits for Your Lifestyle and Location with Scapea."
        case .scapedia: return "Explore, Diagnose, and Nurture with Scapedia! Your Comprehensive Plant Care Companion, Right in Your Pocket."
        }
    }
    
    var image: Image {
        switch self {
        case .ar:
//            return Image(scapeaImage: .arScannerImage)
            return Image(systemName: "arkit")
                .resizable()
        case .curatedKits:
            return Image(systemName: "hand.point.up.left.and.text")
                .resizable()
        case .scapedia:
            return Image(systemName: "atom")
                .resizable()
        }
    }
}
