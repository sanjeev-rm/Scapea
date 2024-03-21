//
//  MyPlantCardView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct MyPlantCardView: View {
    
    @State var myPlant: MyPlant = SAMPLE_MY_PLANTS[0]
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            baseView
            
            if myPlant.needsWater {
                waterDrop
            }
        }
    
    }
}

extension MyPlantCardView {
    
    private var baseView: some View {
        HStack {
            
            myPlant.image
                .frame(width: 60, height: 80)
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(myPlant.name)
                        .font(.headline.bold())
                    Text(myPlant.plantType)
                        .font(.subheadline.bold())
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Label("Moisure: \(myPlant.moisture.formatted())%", systemImage: "water.waves")
                    Spacer()
                    Label("pH: \(myPlant.ph.formatted())", systemImage: "thermometer.medium")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
        }
        .frame(height: 80)
        .padding()
        .background(.thinMaterial)
        .cornerRadius(16, corners: [.allCorners])
    }
    
    private var waterDrop: some View {
        Image(systemName: "drop.fill")
            .foregroundColor(.blue)
            .font(.largeTitle)
            .shadow(radius: 8)
            .padding(.leading, 8)
            .offset(y: -8)
    }
}

#Preview {
    MyPlantCardView()
}
