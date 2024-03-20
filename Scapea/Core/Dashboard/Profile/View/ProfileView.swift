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
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                avatarSection
                
                usernameAndEmailSection
                
                contactSection
                
                arSnapshotsSection
                
//                updatePasswordSection
                
                signOutSection
            }
            .disabled(profileViewModel.fetchingUserProfile)
            .scrollContentBackground(.hidden)
            .background(
                AngularGradient(colors: [Color(.systemGreen), Color(.systemFill)], center: .bottomTrailing)
                    .ignoresSafeArea()
            )
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if profileViewModel.fetchingUserProfile {
                        ProgressView()
                    } else {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
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
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .redacted(reason: profileViewModel.fetchingUserProfile ? .placeholder : [])
                    .onTapGesture {
                        profileViewModel.showUpdateAvatarView = true
                    }
                    .foregroundColor(.secondary.opacity(0.3))
                Spacer()
            }
        }
        .listRowBackground(Color.clear)
    }
    
    private var usernameAndEmailSection: some View {
        Section("Profile") {
            HStack {
                Text("Username")
                    .font(.headline)
                Spacer()
                Text(profileViewModel.username)
                    .foregroundColor(.gray)
                    .font(.system(.body, design: .monospaced))
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
                    .font(.system(.body, design: .monospaced))
                    .redacted(reason: profileViewModel.fetchingUserProfile ? .placeholder : [])
            }
        }
        .listRowBackground(
            Color.clear
                .background(.thinMaterial)
        )
    }
    
    private var arSnapshotsSection: some View {
        Section {
            NavigationLink {
                ARSnapshotsView()
            } label: {
                Button {
                } label: {
                    HStack(spacing: 22) {
                        Image(systemName: "camera.viewfinder")
                            .foregroundColor(Color(uiColor: .tertiaryLabel))
                        Text("Saved AR Snapshots")
                    }
                }
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
    
    private var contactSection: some View {
        Section("Support") {
            
            Button {
                // Get help email
//                settingsViewModel.supportHelpEmail.send(openURL: openURL)
            } label: {
                HStack(spacing: 22) {
                    Image(systemName: "waveform.path.ecg")
                        .foregroundColor(Color(uiColor: .tertiaryLabel))
                        .font(.title3)
                    Text("Help")
                }
            }
            
            Button {
                // Write a review
            } label: {
                HStack(spacing: 22) {
                    Image(systemName: "person.fill.questionmark")
                        .foregroundColor(Color(uiColor: .tertiaryLabel))
                        .font(.title3)
                    Text("FAQ")
                }
            }
            
            Button {
                // Report a bug mail
//                settingsViewModel.supportBugEmail.send(openURL: openURL)
            } label: {
                HStack(spacing: 22) {
                    Image(systemName: "ant.fill")
                        .foregroundColor(Color(uiColor: .tertiaryLabel))
                        .font(.title3)
                    Text("Report a bug")
                }
            }
            
            Button {
            } label: {
                HStack(spacing: 22) {
                    Image(systemName: "atom")
                        .foregroundColor(Color(uiColor: .tertiaryLabel))
                        .font(.title3)
                    Text("Give a suggestion")
                }
            }
            
            Button {
                // Write a review
            } label: {
                HStack(spacing: 22) {
                    Image(systemName: "pencil.line")
                        .foregroundColor(Color(uiColor: .tertiaryLabel))
                        .font(.title3)
                    Text("Write a review")
                }
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
