//
//  ForgotPasswordViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 04/09/23.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var otp: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var presentingOtpView: Bool = false
    @Published var presentingResetPasswordView: Bool = false
    
    @Published var showEmailProgress: Bool = false
    @Published var showOtpProgress: Bool = false
    @Published var showResetPasswordProgress: Bool = false
    
    func allToDefault() {
        email = ""
        otp = ""
        password = ""
        confirmPassword = ""
        presentingOtpView = false
        presentingResetPasswordView = false
    }
    
    func verifyAndSendOtp() {
        showEmailProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.showEmailProgress = false
            self.presentingOtpView = true
        }
    }
    
    func verifyOtp() {
        showOtpProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.showOtpProgress = false
            self.presentingResetPasswordView = true
        }
    }
    
    func resetPassword(completion: @escaping (Bool) -> Void) {
        showResetPasswordProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.allToDefault()
            self.showResetPasswordProgress = false
            completion(true)
        }
    }
}
