//
//  MyPlantsView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct MyPlantsView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Text("My Plants")
                    .font(.largeTitle.bold())
                    .foregroundColor(.accentColor)
                
                ForEach(SAMPLE_MY_PLANTS, id: \.name) { myplant in
                    MyPlantCardView(myPlant: myplant)
                }
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}

#Preview {
    MyPlantsView()
}
