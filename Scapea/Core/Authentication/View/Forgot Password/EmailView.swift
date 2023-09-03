//
//  EmailView.swift
//  Scapea
//
//  Created by Sanjeev RM on 04/09/23.
//

import SwiftUI

struct EmailView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var forgotPasswordViewModel: ForgotPasswordViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
//            Text("Enter Email")
//                .font(.title3.bold())
//                .frame(maxWidth: .infinity)
            
            VStack(spacing: 16) {
                
                TextField("Email", text: $forgotPasswordViewModel.email)
                    .padding()
                    .background(Color(scapeaColor: .textFieldBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Text("An OTP will be sent to this email")
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .font(.caption)
            }
            
            Spacer()
            
            ScapeaButton(title: "Next") {
                // Go to OTP verification
                forgotPasswordViewModel.presentingOtpView = true
            }
        }
        .padding(22)
//        .padding(.top, 32)
        .navigationTitle("Enter Email")
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

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
            .environmentObject(ForgotPasswordViewModel())
    }
}
