//
//  SignUpOtpView.swift
//  Scapea
//
//  Created by Sanjeev RM on 05/09/23.
//

import SwiftUI

struct SignUpOtpView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var signUpViewModel: SignUpViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            VStack(spacing: 16) {
                
                TextField("OTP", text: $signUpViewModel.otp)
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
            
            ScapeaButton(title: "Next", showProgress: $signUpViewModel.showOtpProgress) {
                // Go to Selecting Avatar
                signUpViewModel.verifyOtp()
            }
        }
        .padding()
        .padding(.bottom, 40)
        .navigationTitle("Enter OTP")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    signUpViewModel.presentingOtpView = false
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

struct SignUpOtpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpOtpView()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(SignUpViewModel())
    }
}
