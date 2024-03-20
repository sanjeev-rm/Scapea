//
//  ServiceDetailsView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct ServiceDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
//    @State var service: Service = .service1
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Service Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(APP_SECONDARY_BACKGROUND_VIEW)
        }
    }
}

#Preview {
    ServiceDetailsView()
}
