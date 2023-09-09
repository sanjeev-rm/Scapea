//
//  PasswordField.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct PasswordField: View {
    
    var title: String?
    
    @Binding var password: String
    @State var showPassword: Bool = false
    
    var body: some View {
        HStack {
            if showPassword {
                TextField(title ?? "", text: $password)
            } else {
                SecureField(title ?? "", text: $password)
            }
            
            Spacer()
            
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "lock.open" : "lock")
            }
            .foregroundColor(.primary.opacity(0.3))
        }
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(password: .constant("password"))
    }
}
