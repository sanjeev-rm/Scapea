//
//  LoginView.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var forgotPasswordViewModel: ForgotPasswordViewModel
    
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            title
            
            textFieldsAndForgotPasswordButton
            
            Spacer()
            
            loginAndSignUpButton
        }
        .padding(22)
        .fullScreenCover(isPresented: $authenticationViewModel.showForgotPassword) {
            forgotPasswordViewModel.allToDefault()
        } content: {
            ForgotPasswordView()
        }

    }
}



extension LoginView {
    
    private var title: some View {
        VStack(alignment: .leading) {
            Text("Hey,")
            Text("Login")
        }
        .font(.largeTitle.bold())
    }
    
    private var textFieldsAndForgotPasswordButton: some View {
        VStack {
            VStack(spacing: 16) {
                TextField("Username", text: $loginViewModel.username)
                Divider()
                PasswordField(title: "Password", password: $loginViewModel.password)
            }
            .textInputAutocapitalization(.never)
            .padding(16)
            .background(Color(scapeaColor: .textFieldBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Button {
                // Show Forgot Password
                authenticationViewModel.showForgotPassword = true
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 8)
            }

        }
    }
    
    private var loginAndSignUpButton: some View {
        VStack(spacing: 16) {
            
            ScapeaButton(title: "Login") {
                // Go to dashboard
            }
            
            Button {
                // Show SignUp page
                withAnimation(.easeInOut) {
                    authenticationViewModel.showSignUp = true
                }
            } label: {
                HStack {
                    Text("First time?")
                        .foregroundColor(.primary)
                    Text("Sign Up")
                        .bold()
                        .underline()
                }
                .font(.footnote)
            }
        }
        .padding(.bottom, 8)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationViewModel())
    }
}
