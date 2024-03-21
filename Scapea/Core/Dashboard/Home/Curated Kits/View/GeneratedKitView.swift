//
//  GeneratedKitView.swift
//  Scapea
//
//  Created by Sanjeev RM on 21/03/24.
//

import SwiftUI

struct GeneratedKitView: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(SAMPLE_ITEMS, id: \.title) { item in
                    MarketItemView(item: item)
                }
            }
            
            Spacer()
            
            ScapeaButton(title: "Buy", showProgress: .constant(false)) {}
        }
        .padding()
        .scrollIndicators(.hidden)
        .navigationTitle("Your kit")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(APP_BACKGROUND_VIEW)
    }
}

#Preview {
    NavigationStack {
        GeneratedKitView()
    }
}
