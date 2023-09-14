//
//  ARAction.swift
//  Scapea
//
//  Created by Sanjeev RM on 12/09/23.
//

import Foundation
import SwiftUI

enum ARAction {
    case placePlantObject(_ plant: ARObjectPlant)
    case placeShapeObject(_ shape: ARObjectShape, color: Color)
    case takeAScreenshot
    case removeAllAnchors
}
