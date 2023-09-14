//
//  ActionCardView.swift
//  Scapea
//
//  Created by Sanjeev RM on 10/09/23.
//

import SwiftUI

struct ActionCardView: View {
    
    var action: ScapeaAction = .chat
    
    var body: some View {
        Rectangle()
            .background(.thinMaterial)
            .overlay(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(action.title)
                        .font(.largeTitle.bold())
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        switch action {
                        case .ar:
                            action.image
                        default:
                            action.image
                                .fontWeight(.ultraLight)
                                .frame(width: 120, height: 120)
                                .padding(.vertical)
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Text(action.description)
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                }
                .foregroundColor(.white)
                .padding()
                .padding(.vertical)
            }
            .cornerRadius(32)
            .padding(.vertical, 16)
            .shadow(radius: 5)
    }
}

struct ActionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActionCardView()
    }
}
