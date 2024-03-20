//
//  OnboardingStep.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import Foundation
import SwiftUI

enum OnboardingStep: CaseIterable {
    case one
    case two
    case three
    
    var image: Image {
        switch self {
        case .one: return Image(.onboardingStep1)
        case .two: return Image(.onboardingStep2)
        case .three: return Image(.onboardingStep3)
        }
    }
    
    var title: String {
        switch self {
        case .one: return "Find your space"
        case .two: return "Scan your space"
        case .three: return "Enjoy the view"
        }
    }
    
    var description: String {
        switch self {
        case .one: return "Find a space where you would like to put plants, could be a balcony, living room, kitchen, etc"
        case .two: return "Scan the space and leave the rest to the app"
        case .three: return "You can see the plants placed in your space, you can play around with the placement of these plants"
        }
    }
    
    var primaryColor: Color {
        switch self {
        case .one: return Color(scapeaColor: .onboardingGreen)
        case .two: return Color(scapeaColor: .onboardingYellow)
        case .three: return Color(scapeaColor: .onboardingBrown)
        }
    }
    
    var secondaryColor: Color {
        switch self {
        case .one: return Color.white.opacity(0.8)
        case .two: return Color.white.opacity(0.8)
        case .three: return Color.white.opacity(0.8)
        }
    }
    
    static var lastStep: OnboardingStep? {
        guard let lastStep = OnboardingStep.allCases.last else { return nil }
        return lastStep
    }
}
