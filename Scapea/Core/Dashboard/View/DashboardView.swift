//
//  DashboardView.swift
//  Scapea
//
//  Created by Sanjeev RM on 05/09/23.
//

import SwiftUI

struct DashboardView: View {
    
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

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(AuthenticationViewModel())
    }
}
