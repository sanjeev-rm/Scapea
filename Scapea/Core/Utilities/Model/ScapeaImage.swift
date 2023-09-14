//
//  ScapeaImage.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import Foundation
import SwiftUI

enum ScapeaImage: String {
    case onboardingStep1Image = "onboarding.step1.image"
    case arScannerImage = "ar.scanner.image"
    case arObjectPlantTulipImage = "ar.object.plant.tulip.image"
}

extension Image {
    init(scapeaImage: ScapeaImage) {
        self.init(scapeaImage.rawValue)
    }
}
