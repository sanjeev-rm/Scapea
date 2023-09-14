//
//  UpdatePasswordView.swift
//  Scapea
//
//  Created by Sanjeev RM on 08/09/23.
//

import SwiftUI

struct UpdatePasswordView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                PasswordField(title: "Current password", password: $profileViewModel.currentPassword)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                VStack(spacing: 16) {
                    PasswordField(title: "New password", password: $profileViewModel.newPassword)
                    Divider()
                    TextField("Confirm new password", text: $profileViewModel.confirmNewPassword)
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Spacer()
            }
            .textInputAutocapitalization(.never)
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // Dismiss the view, cancel
                        profileViewModel.showUpdatePasswordView = false
                    } label: {
                        Text("cancel")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Update avatar
                        profileViewModel.updatePassword { success in
                            if success {
                                profileViewModel.showUpdatePasswordView = false
                                profileViewModel.fetchUserProfile()
                            } else {
                                // Handle errors
                            }
                        }
                    } label: {
                        if profileViewModel.updatingPassword {
                            ProgressView()
                        } else {
                            Text("Done")
                        }
                    }
                }
            }
        }
    }
}

struct UpdatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePasswordView()
            .environmentObject(ProfileViewModel())
    }
}
