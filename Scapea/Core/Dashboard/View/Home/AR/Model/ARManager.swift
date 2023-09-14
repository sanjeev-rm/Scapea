//
//  ARManager.swift
//  Scapea
//
//  Created by Sanjeev RM on 12/09/23.
//

import Foundation
import Combine

class ARManager {
    static let shared = ARManager()
    private init() {}
    
    var actionStream = PassthroughSubject<ARAction, Never>()
}
