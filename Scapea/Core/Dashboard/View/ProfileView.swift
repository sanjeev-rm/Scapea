//
//  ProfileView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button(role: .destructive) {
                        // Log out, Go to login page
                        authenticationViewModel.isLoggedIn = false
                        authenticationViewModel.showSignUp = false
                    } label: {
                        Text("Sign Out")
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthenticationViewModel())
    }
}
