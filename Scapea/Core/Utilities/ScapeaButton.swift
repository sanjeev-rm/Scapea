//
//  ScapeaButton.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct ScapeaButton: View {
    var title: AttributedString
    @Binding var showProgress: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if showProgress {
                ProgressView()
                    .tint(.white)
                    .frame(maxWidth: .infinity)
            } else {
                Button {
                    action()
                } label: {
                    Text(title)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(height: 22)
        .font(.title3.bold())
        .foregroundColor(Color(.white))
        .padding()
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct ScapeaButton_Previews: PreviewProvider {
    static var previews: some View {
        ScapeaButton(title: "tap", showProgress: .constant(false)) {
            // Some Action
        }
    }
}
