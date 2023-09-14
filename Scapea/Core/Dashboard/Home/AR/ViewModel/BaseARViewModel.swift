//
//  BaseARViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 12/09/23.
//

import Foundation
import SwiftUI

class BaseARViewModel: ObservableObject {
    
    @Published var showAddObjectOptions: Bool = false
    
    @Published var snapShotClicked: Bool = false
    
    func showSnapshotClickedAlert() {
        withAnimation(.easeInOut) {
            snapShotClicked = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.snapShotClicked = false
            }
        }
    }
}
