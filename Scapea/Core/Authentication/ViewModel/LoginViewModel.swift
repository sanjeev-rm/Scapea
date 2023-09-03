//
//  LoginViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
}
