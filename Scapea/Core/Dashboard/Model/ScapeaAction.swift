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
        case .chat: return "Trivia"
        case .aboutUs: return "About Us"
        }
    }
    
    var description: String {
        switch self {
        case .ar: return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        case .chat: return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        case .aboutUs: return "Find out who we are & what we do"
        }
    }
    
    var image: Image {
        switch self {
        case .ar:
            return Image(scapeaImage: .arScannerImage)
                .resizable()
        case .chat:
            return Image(systemName: "text.bubble")
                .resizable()
        case .aboutUs:
            return Image(systemName: "bonjour")
                .resizable()
        }
    }
}
