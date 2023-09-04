//
//  OTPView.swift
//  Scapea
//
//  Created by Sanjeev RM on 04/09/23.
//

import SwiftUI

struct OTPView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var forgotPasswordViewModel: ForgotPasswordViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            VStack(spacing: 16) {
                
                TextField("OTP", text: $forgotPasswordViewModel.otp)
                    .padding()
                    .background(Color(scapeaColor: .textFieldBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Text("The OTP has been sent to your email")
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .font(.caption)
            }
            
            Button {
                // Resend OTP
            } label: {
                Text("Resent OTP")
                    .font(.footnote)
                    .underline()
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            ScapeaButton(title: "Next", showProgress: $forgotPasswordViewModel.showOtpProgress) {
                // Go to Reset password
                forgotPasswordViewModel.presentingResetPasswordView = true
            }
        }
        .padding()
        .navigationTitle("Enter OTP")
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
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    forgotPasswordViewModel.presentingOtpView = false
                } label: {
                    Image(systemName: "chevron.left")
                }

            }
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
            .environmentObject(ForgotPasswordViewModel())
    }
}
