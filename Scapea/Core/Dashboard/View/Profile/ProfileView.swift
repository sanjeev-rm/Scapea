//
//  ProfileView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @StateObject var profileViewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                avatarSection
                
                usernameAndEmailSection
                
                updatePasswordSection
                
                signOutSection
            }
            .disabled(profileViewModel.fetchingUserProfile)
            .scrollContentBackground(.hidden)
            .background(
                AngularGradient(colors: [Color(.systemGreen), Color(.systemFill)], center: .bottomTrailing)
                    .ignoresSafeArea()
            )
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if profileViewModel.fetchingUserProfile {
                        ProgressView()
                    }
                }
            }
            .onAppear {
                profileViewModel.fetchUserProfile()
            }
            .sheet(isPresented: $profileViewModel.showUpdateAvatarView) {
                UpdateAvatarView()
                    .environmentObject(profileViewModel)
                    .presentationDetents([.medium])
                    .interactiveDismissDisabled()
            }
            .sheet(isPresented: $profileViewModel.showUpdateNameView) {
                UpdateUsernameView()
                    .environmentObject(profileViewModel)
                    .presentationDetents([.height(175)])
                    .interactiveDismissDisabled()
            }
            .sheet(isPresented: $profileViewModel.showUpdatePasswordView) {
                UpdatePasswordView()
                    .environmentObject(profileViewModel)
                    .interactiveDismissDisabled()
            }
        }
    }
}

extension ProfileView {
    
    private var avatarSection: some View {
        Section {
            HStack {
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .redacted(reason: profileViewModel.fetchingUserProfile ? .placeholder : [])
                    .onTapGesture {
                        profileViewModel.showUpdateAvatarView = true
                    }
                    .foregroundColor(.gray.opacity(0.7))
                Spacer()
            }
        }
        .listRowBackground(Color.clear)
    }
    
    private var usernameAndEmailSection: some View {
        Section {
            HStack {
                Text("Username")
                    .font(.headline)
                Spacer()
                Text(profileViewModel.username)
                    .foregroundColor(.gray)
                    .fontDesign(.monospaced)
                    .onTapGesture {
                        profileViewModel.showUpdateNameView = true
                    }
                    .redacted(reason: profileViewModel.fetchingUserProfile ? .placeholder : [])
            }
            
            HStack {
                Text("Email")
                    .font(.headline)
                Spacer()
                Text(profileViewModel.email)
                    .foregroundColor(.gray)
                    .fontDesign(.monospaced)
                    .redacted(reason: profileViewModel.fetchingUserProfile ? .placeholder : [])
            }
        }
        .listRowBackground(
            Color.clear
                .background(.thinMaterial)
        )
    }
    
    private var updatePasswordSection: some View {
        Section {
            Button {
                // Show Update password View
                profileViewModel.showUpdatePasswordView = true
            } label: {
                HStack(spacing: 22) {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(uiColor: .tertiaryLabel))
                    Text("Update Password")
                }
            }
        }
        .listRowBackground(
            Color.clear
                .background(.thinMaterial)
        )
    }
    
    private var signOutSection: some View {
        Section {
            Button(role: .destructive) {
                // Log out, Go to login page
                withAnimation(.easeInOut(duration: 0.3)) {
                    authenticationViewModel.isLoggedIn = false
                    authenticationViewModel.showSignUp = false
                }
            } label: {
                Text("Sign Out")
            }
        }
        .listRowBackground(
            Color.clear
                .background(.thinMaterial)
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthenticationViewModel())
    }
}
