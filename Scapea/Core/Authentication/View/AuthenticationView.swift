//
//  AuthenticationView.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        ZStack {
            if authenticationViewModel.showSignUp {
                SignUpView()
            } else {
                LoginView()
            }
        }
        .fullScreenCover(isPresented: $authenticationViewModel.showOnboarding) {
            OnboardingView()
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
            .environmentObject(AuthenticationViewModel())
    }
}
