//
//  AvatarView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct AvatarView: View {
    
    var scapeaAvatar: ScapeaAvatar = .one
    @Binding var currentlySelectedAvatar: ScapeaAvatar
    var giveDefaultSize: Bool = false
    
    var isSelected: Bool {
        return scapeaAvatar == currentlySelectedAvatar
    }
    
    var body: some View {
        ZStack {
            if giveDefaultSize {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
            }
        }
        .clipShape(Circle())
        .redacted(reason: .placeholder)
        .padding(3)
        .background(
            Circle()
                .stroke(lineWidth: 3)
                .foregroundColor(isSelected ? .accentColor : .clear)
        )
        .onTapGesture {
            withAnimation(.easeInOut) {
                if isSelected {
                    // Do nothing
                } else {
                    currentlySelectedAvatar = scapeaAvatar
                }
            }
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(currentlySelectedAvatar: .constant(.one))
    }
}
