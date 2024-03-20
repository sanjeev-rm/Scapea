//
//  MyPlant.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import Foundation
import SwiftUI

struct MyPlant {
    
    var image: Image
    var name: String
    var plantType: String
    var moisture: Double
    var ph: Double
    var needsWater: Bool
}

let SAMPLE_MY_PLANTS = [
    MyPlant(image: Image(.plant1), name: "Betty", plantType: "Anthurium", moisture: 40, ph: 6.4, needsWater: true),
    MyPlant(image: Image(.plant2), name: "Tom", plantType: "Sanke plant", moisture: 70, ph: 6.4, needsWater: false),
    MyPlant(image: Image(.plant1), name: "Parnika", plantType: "Aloe vera", moisture: 80, ph: 6.4, needsWater: false),
    MyPlant(image: Image(.plant2), name: "Sylvie", plantType: "Bougainvillea", moisture: 90, ph: 6.4, needsWater: false)
]
