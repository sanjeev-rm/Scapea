//
//  UpdateUsernameView.swift
//  Scapea
//
//  Created by Sanjeev RM on 08/09/23.
//

import SwiftUI

struct UpdateUsernameView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $profileViewModel.username)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                // Dismiss the view, cancel
                                profileViewModel.showUpdateNameView = false
                            } label: {
                                Text("cancel")
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                // Update avatar
                                profileViewModel.updateUsername { success in
                                    if success {
                                        profileViewModel.showUpdateNameView = false
                                        profileViewModel.fetchUserProfile()
                                    } else {
                                        // Handle errors
                                    }
                                }
                            } label: {
                                if profileViewModel.updatingUsername {
                                    ProgressView()
                                } else {
                                    Text("Done")
                                }
                            }
                        }
                    }
                    .disabled(profileViewModel.updatingUsername)
                
                Spacer()
            }
        }
    }
}

struct UpdateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateUsernameView()
            .environmentObject(ProfileViewModel())
    }
}
