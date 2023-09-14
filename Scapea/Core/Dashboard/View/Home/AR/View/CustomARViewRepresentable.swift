//
//  CustomARViewRepresentable.swift
//  Scapea
//
//  Created by Sanjeev RM on 11/09/23.
//

import Foundation
import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
}
