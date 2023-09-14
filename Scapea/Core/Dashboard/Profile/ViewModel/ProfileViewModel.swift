//
//  ProfileViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 08/09/23.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var avatar: ScapeaAvatar = .one
    @Published var username: String = "john doe"
    @Published var email: String = "johndoe@gmail.com"
    
    @Published var showUpdateAvatarView: Bool = false
    @Published var showUpdateNameView: Bool = false
    @Published var showUpdatePasswordView: Bool = false
    
    @Published var currentPassword: String = ""
    @Published var newPassword: String = ""
    @Published var confirmNewPassword: String = ""
    
    @Published var fetchingUserProfile: Bool = false
    @Published var updatingAvatar: Bool = false
    @Published var updatingUsername: Bool = false
    @Published var updatingPassword: Bool = false
    
    func fetchUserProfile() {
        fetchingUserProfile = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.fetchingUserProfile = false
        }
    }
    
    func updateAvatar(completion: @escaping (Bool) -> Void) {
        // Update avatar in server
        updatingAvatar = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.updatingAvatar = false
            completion(true)
        }
    }
    
    func updateUsername(completion: @escaping (Bool) -> Void) {
        // Update username in server
        updatingUsername = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.updatingUsername = false
            completion(true)
        }
    }
    
    func updatePassword(completion: @escaping (Bool) -> Void) {
        // Update password in server
        updatingPassword = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.updatingPassword = false
            completion(true)
        }
    }
}
