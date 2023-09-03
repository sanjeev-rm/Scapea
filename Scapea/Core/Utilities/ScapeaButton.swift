//
//  ScapeaButton.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct ScapeaButton: View {
    var title: AttributedString
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.title3.bold())
                .foregroundColor(Color(.white))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

struct ScapeaButton_Previews: PreviewProvider {
    static var previews: some View {
        ScapeaButton(title: "tap") {
            // Some Action
        }
    }
}
