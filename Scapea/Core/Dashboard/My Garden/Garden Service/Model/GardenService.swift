//
//  GardenService.swift
//  Scapea
//
//  Created by Sanjeev RM on 21/03/24.
//

import Foundation
import SwiftUI

enum GardenService: String, CaseIterable {
    case none = ""
    case lawnCare = "Lawn Care"
    case weeding = "Weeding"
    case pruningAndTrimming = "Priuning and Trimming"
    case pestAndDiseaseControl = "Pest and disease control"
    case landscapeDesigning = "Landscape and designing"
    case consultationAndAdvice = "Consultation and advice"
    
    var image: Image {
        switch self {
        case .none: Image(systemName: "")
        case .lawnCare: Image(systemName: "stethoscope")
        case .weeding: Image(systemName: "laurel.leading")
        case .pruningAndTrimming: Image(systemName: "scissors")
        case .pestAndDiseaseControl: Image(systemName: "ant.fill")
        case .landscapeDesigning: Image(systemName: "paintbrush.pointed.fill")
        case .consultationAndAdvice: Image(systemName: "shareplay")
        }
    }
}
