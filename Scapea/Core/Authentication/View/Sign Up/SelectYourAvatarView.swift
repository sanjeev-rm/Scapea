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
        VStack(spacing: 32) {
            VStack(spacing: 32) {
                HStack(spacing: 32) {
                    AvatarView(scapeaAvatar: .one, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                    AvatarView(scapeaAvatar: .two, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                    AvatarView(scapeaAvatar: .three, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                }
                HStack(spacing: 32) {
                    AvatarView(scapeaAvatar: .four, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                    AvatarView(scapeaAvatar: .five, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                    AvatarView(scapeaAvatar: .six, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                }
                HStack(spacing: 32) {
                    AvatarView(scapeaAvatar: .seven, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                    AvatarView(scapeaAvatar: .eight, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                    AvatarView(scapeaAvatar: .nine, currentlySelectedAvatar: $signUpViewModel.selectedAvatar)
                }
            }
            
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
