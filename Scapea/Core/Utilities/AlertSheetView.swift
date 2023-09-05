//
//  AlertSheetView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct AlertSheetView: View {
    
    var type: AlertType = .updatedPasswordForgotPassword
    
    enum AlertType {
        case progress
        case updatedPasswordForgotPassword
        
        var imageSystemName: String? {
            switch self {
            case .progress: return nil
            case .updatedPasswordForgotPassword: return "checkmark"
            }
        }
        
        var imageForegroundColor: Color {
            switch self {
            case .progress: return .primary
            case .updatedPasswordForgotPassword: return Color(.systemGreen)
            }
        }
        
        var message: String {
            switch self {
            case .progress: return "Loading"
            case .updatedPasswordForgotPassword: return "Updated password, login with new credentials"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 32) {
            
            if let imageSystemName = type.imageSystemName {
                Image(systemName: imageSystemName)
                    .font(.largeTitle)
                    .foregroundColor(type.imageForegroundColor)
            } else {
                ProgressView()
                    .controlSize(.large)
            }
            
            Text(type.message)
                .font(.callout)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct AlertSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AlertSheetView()
    }
}
