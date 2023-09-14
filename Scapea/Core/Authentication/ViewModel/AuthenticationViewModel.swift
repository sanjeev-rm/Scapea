//
//  AuthenticationViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false // True for now testing convenience
    
    @Published var showOnboarding: Bool = true
    
    @Published var showSignUp: Bool = false
}
