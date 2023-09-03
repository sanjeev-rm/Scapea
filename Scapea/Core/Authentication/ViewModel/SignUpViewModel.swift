//
//  SignUpViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
}
