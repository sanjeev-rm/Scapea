//
//  LoginViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var showProgress: Bool = false
    
    @Published var showForgotPassword: Bool = false
    
    @Published var showUpdatedPasswordAlert: Bool = false
    
    func allToDefault() {
        username = ""
        password = ""
        showProgress = false
        showForgotPassword = false
    }
    
    func toggleShowUpdatedPasswordAlert() {
        withAnimation(.easeInOut) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.showUpdatedPasswordAlert = !self.showUpdatedPasswordAlert
            }
        }
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        showProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.allToDefault()
            self.showProgress = false
            completion(true)
        }
    }
}
