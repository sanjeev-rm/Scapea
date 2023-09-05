//
//  SelectYourAvatarView.swift
//  Scapea
//
//  Created by Sanjeev RM on 05/09/23.
//

import SwiftUI

struct SelectYourAvatarView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var signUpViewModel: SignUpViewModel
    
    var body: some View {
        VStack {
            VStack(spacing: 32) {
                HStack(spacing: 32) {
                    AvatarView()
                    AvatarView()
                    AvatarView()
                }
                HStack(spacing: 32) {
                    AvatarView()
                    AvatarView()
                    AvatarView()
                }
                HStack(spacing: 32) {
                    AvatarView()
                    AvatarView()
                    AvatarView()
                }
            }
            .foregroundColor(.gray.opacity(0.7))
            .padding()
            
            Spacer()
            
            ScapeaButton(title: "Sign Up", showProgress: $signUpViewModel.showAvatarProgress) {
                signUpViewModel.signUp { success in
                    if success {
                        // Go to dashboard
                        authenticationViewModel.isLoggedIn = true
                    } else {
                        // Show error, couldn't signup
                    }
                }
            }
        }
        .padding()
        .padding(.bottom, 40)
        .navigationTitle("Select your avatar")
        .navigationBarBackButtonHidden()
    }
}

struct SelectYourAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        SelectYourAvatarView()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(SignUpViewModel())
    }
}
