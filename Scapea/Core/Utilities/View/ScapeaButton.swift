//
//  ScapeaButton.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct ScapeaButton: View {
    var title: AttributedString
    var style: Style = .basic
    @Binding var showProgress: Bool
    var action: () -> Void
    
    enum Style {
        case basic
        case destructive
    }
    
    var body: some View {
        
        if showProgress {
            ProgressView()
                .tint(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 22)
                .font(.title3.bold())
                .foregroundColor((style == .basic) ? Color.white : Color(.systemRed).opacity(0.8))
                .padding()
                .background((style == .basic) ? Color.accentColor : Color(uiColor: .systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        } else {
            Button {
                action()
            } label: {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 22)
                    .font(.title3.bold())
                    .foregroundColor((style == .basic) ? Color.white : Color(.systemRed).opacity(0.8))
                    .padding()
                    .background((style == .basic) ? Color.accentColor : Color(uiColor: .systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }
}

struct ScapeaButton_Previews: PreviewProvider {
    static var previews: some View {
        ScapeaButton(title: "tap", showProgress: .constant(false)) {
            // Some Action
        }
    }
}
