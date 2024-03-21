//
//  Scapedia.swift
//  Scapea
//
//  Created by Sanjeev RM on 21/03/24.
//

import SwiftUI

struct Scapedia: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
                HStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Scapedia")
                            .font(.largeTitle.bold())
                            .foregroundColor(.accentColor)
                        Text("Explore, Diagnose, and Nurture with Scapedia! Your Comprehensive Plant Care Companion, Right in Your Pocket.")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
                .padding()
                
                Divider()
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(APP_BACKGROUND_VIEW)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    Scapedia()
}
