//
//  AvatarView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct AvatarView: View {
    
    @State var isSelected: Bool = false
    var image: Image = Image(systemName: "")
    
    var body: some View {
        Circle()
            .overlay(content: {
                image
                    .resizable()
                    .offset(y: 8)
                    .clipShape(Circle())
            })
            .foregroundColor(.gray.opacity(0.7))
            .padding(3)
            .background(
                Circle()
                    .stroke(lineWidth: 3)
                    .foregroundColor(isSelected ? .accentColor : .clear)
            )
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isSelected = !isSelected
                }
            }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
