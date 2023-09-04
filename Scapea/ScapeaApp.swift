//
//  ScapeaApp.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

@main
struct ScapeaApp: App {
    
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    @StateObject var forgotPassowrdViewModel = ForgotPasswordViewModel()
    @StateObject var signUpViewModel = SignUpViewModel()
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authenticationViewModel.isLoggedIn {
                DashboardView()
                    .environmentObject(authenticationViewModel)
            } else {
                AuthenticationView()
                    .environmentObject(authenticationViewModel)
                    .environmentObject(forgotPassowrdViewModel)
                    .environmentObject(signUpViewModel)
                    .environmentObject(loginViewModel)
            }
        }
    }
}
