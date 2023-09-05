//
//  HomeView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State var showProgress: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.system(size: 27, weight: .ultraLight, design: .monospaced))
            
            ScapeaButton(title: "Log out", style: .destructive, showProgress: $showProgress) {
                // Log out, Go to login page
                authenticationViewModel.isLoggedIn = false
                authenticationViewModel.showSignUp = false
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
