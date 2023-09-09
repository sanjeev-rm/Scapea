//
//  SignUpViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var otp: String = ""
    
    @Published var selectedAvatar: ScapeaAvatar = .one
    
    @Published var presentingOtpView: Bool = false
    @Published var presentingAvatarView: Bool = false
    
    @Published var showInitialProgress: Bool = false
    @Published var showOtpProgress: Bool = false
    @Published var showAvatarProgress: Bool = false
    
    func allToDefault() {
        username = ""
        email = ""
        password = ""
        confirmPassword = ""
        otp = ""
        presentingOtpView = false
        presentingAvatarView = false
        showInitialProgress = false
        showOtpProgress = false
        showAvatarProgress = false
    }
    
    func verifyAndSendOtp() {
        showInitialProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.showInitialProgress = false
            self.presentingOtpView = true
        }
    }
    
    func verifyOtp() {
        showOtpProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.showOtpProgress = false
            self.presentingAvatarView = true
        }
    }
    
    func signUp(completion: @escaping (Bool) -> Void) {
        showAvatarProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.allToDefault()
            self.showAvatarProgress = false
            completion(true)
        }
    }
}
