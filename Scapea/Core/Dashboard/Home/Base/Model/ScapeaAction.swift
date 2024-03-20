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
    case chat
    case aboutUs
    
    var cardView: some View {
        return ActionCardView(action: self)
    }
    
    var title: String {
        switch self {
        case .ar: return "AR"
        case .chat: return "Curated Kits"
        case .aboutUs: return "Scapedia"
        }
    }
    
    var description: String {
        switch self {
        case .ar: return "See it, Believe it, Grow it! Explore Your Dream Garden in Reality with Scapea's AR Garden Visualizer."
        case .chat: return "Tailored Gardens, Delivered to Your Doorstep! Discover Perfectly Curated Plant Kits for Your Lifestyle and Location with Scapea."
        case .aboutUs: return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        }
    }
    
    var image: Image {
        switch self {
        case .ar:
//            return Image(scapeaImage: .arScannerImage)
            return Image(systemName: "arkit")
                .resizable()
        case .chat:
            return Image(systemName: "hand.point.up.left.and.text")
                .resizable()
        case .aboutUs:
            return Image(systemName: "atom")
                .resizable()
        }
    }
}
