//
//  MarketItemView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct MarketItemView: View {
    
    @State var item: MarketItem = SAMPLE_ITEMS[0]
    
    var body: some View {
        HStack {
            
            item.image
                .frame(width: 60, height: 80)
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.headline.bold())
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .frame(height: 80)
        .padding()
        .background(.regularMaterial)
        .cornerRadius(16, corners: [.allCorners])
    }
}

#Preview {
    MarketItemView()
}
