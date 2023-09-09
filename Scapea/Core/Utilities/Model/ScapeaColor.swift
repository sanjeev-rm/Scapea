//
//  ScapeaColor.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import Foundation
import SwiftUI

enum ScapeaColor: String {
    case onboardingGreen = "onboarding.green"
    case onboardingYellow = "onboarding.yellow"
    case onboardingBrown = "onboarding.brown"
    
    case textFieldBackground = "textField.background.color"
}

extension Color {
    init(scapeaColor: ScapeaColor) {
        self.init(scapeaColor.rawValue)
    }
}
