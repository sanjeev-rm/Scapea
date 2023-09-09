//
//  UpdateAvatarView.swift
//  Scapea
//
//  Created by Sanjeev RM on 08/09/23.
//

import SwiftUI

struct UpdateAvatarView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                HStack {
                    Spacer()
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .redacted(reason: .placeholder)
                    Spacer()
                }
                
                VStack(spacing: 0) {
                    Text("Pick an avatar")
                        .textCase(.uppercase)
                        .font(.footnote)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(ScapeaAvatar.allCases, id: \.self) { avatar in
                                AvatarView(scapeaAvatar: avatar,
                                           currentlySelectedAvatar: $profileViewModel.avatar,
                                           giveDefaultSize: true)
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // Dismiss the view, cancel
                        profileViewModel.showUpdateAvatarView = false
                    } label: {
                        Text("cancel")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Update avatar
                        profileViewModel.updateAvatar { success in
                            if success {
                                profileViewModel.showUpdateAvatarView = false
                                profileViewModel.fetchUserProfile()
                            } else {
                                // Handle error
                            }
                        }
                    } label: {
                        if profileViewModel.updatingAvatar {
                            ProgressView()
                        } else {
                            Text("Done")
                        }
                    }
                }
            }
            .disabled(profileViewModel.updatingAvatar)
        }
    }
}

struct UpdateAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateAvatarView()
            .environmentObject(ProfileViewModel())
    }
}
