//
//  GardenServiceView.swift
//  Scapea
//
//  Created by Sanjeev RM on 21/03/24.
//

import SwiftUI

struct GardenServiceView: View {
    var gardenService: GardenService = .lawnCare
    
    var body: some View {
        VStack(alignment: .center) {
            gardenService.image
//                .resizable()
                .font(.title2)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.accentColor)
            
//            Text(gardenService.rawValue)
//                .foregroundStyle(.secondary)
//                .font(.caption)
        }
        .padding(16)
        .background(.thinMaterial)
        .cornerRadius(16)
    }
}

#Preview {
    GardenServiceView()
}
