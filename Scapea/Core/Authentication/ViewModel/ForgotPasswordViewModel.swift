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
    
    func allToDefault() {
        email = ""
        otp = ""
        password = ""
        confirmPassword = ""
        presentingOtpView = false
        presentingResetPasswordView = false
    }
}
