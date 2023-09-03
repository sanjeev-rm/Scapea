//
//  SignUpView.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @StateObject var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            title
            
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 32) {
                        inputFields
                        
                        Spacer()
                        
                        verifyAndloginButton
                    }
                    .frame(minHeight: geometry.size.height)
                }
                .frame(width: geometry.size.width)
                .scrollBounceBehavior(.basedOnSize)
            }
        }
        .padding(22)
    }
}



extension SignUpView {
    
    private var title: some View {
        VStack(alignment: .leading) {
            Text("Hey,")
            Text("Let's get started")
        }
        .font(.largeTitle.bold())
    }
    
    private var inputFields: some View {
        VStack(spacing: 22) {
            usernameEmailFields
            passwordFields
        }
    }
    
    private var usernameEmailFields: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $signUpViewModel.username)
            Divider()
            TextField("Email", text: $signUpViewModel.email)
        }
        .textInputAutocapitalization(.never)
        .padding(16)
        .background(Color(scapeaColor: .textFieldBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private var passwordFields: some View {
        VStack(spacing: 16) {
            PasswordField(title: "New Password", password: $signUpViewModel.password)
            Divider()
            SecureField("Confirm Password", text: $signUpViewModel.email)
        }
        .textInputAutocapitalization(.never)
        .padding(16)
        .background(Color(scapeaColor: .textFieldBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private var verifyAndloginButton: some View {
        VStack(spacing: 16) {
            
            ScapeaButton(title: "Verify") {
                // Go to verify OTP verification view
            }
            
            Button {
                // Show Login page
                withAnimation(.easeInOut) {
                    authenticationViewModel.showSignUp = false
                }
            } label: {
                HStack {
                    Text("Visiting again?")
                        .foregroundColor(.primary)
                    Text("Login")
                        .bold()
                        .underline()
                }
                .font(.footnote)
            }
        }
        .padding(.bottom, 8)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(AuthenticationViewModel())
    }
}
