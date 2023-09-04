//
//  ResetPasswordView.swift
//  Scapea
//
//  Created by Sanjeev RM on 04/09/23.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var forgotPasswordViewModel: ForgotPasswordViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            VStack(spacing: 16) {
                PasswordField(title: "New Password", password: $forgotPasswordViewModel.password)
                Divider()
                SecureField("Confirm Password", text: $forgotPasswordViewModel.confirmPassword)
            }
            .textInputAutocapitalization(.never)
            .padding(16)
            .background(Color(scapeaColor: .textFieldBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Spacer()
            
            ScapeaButton(title: "Done", showProgress: $forgotPasswordViewModel.showResetPasswordprogress) {
                // Go to Login
                authenticationViewModel.showForgotPassword = false
            }
        }
        .padding()
        .navigationTitle("Reset Password")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // Dismiss Forgot password
                    authenticationViewModel.showForgotPassword = false
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
            .environmentObject(ForgotPasswordViewModel())
            .environmentObject(AuthenticationViewModel())
    }
}
