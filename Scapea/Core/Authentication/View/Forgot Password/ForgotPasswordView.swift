//
//  ForgotPasswordView.swift
//  Scapea
//
//  Created by Sanjeev RM on 04/09/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @EnvironmentObject var forgotPasswordViewModel: ForgotPasswordViewModel
    
    @State var email: String = ""
    
    var body: some View {
        NavigationStack {
            EmailView()
//                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $forgotPasswordViewModel.presentingOtpView) {
                    OTPView()
                }
                .navigationDestination(isPresented: $forgotPasswordViewModel.presentingResetPasswordView) {
                    ResetPasswordView()
                }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
            .environmentObject(ForgotPasswordViewModel())
    }
}
