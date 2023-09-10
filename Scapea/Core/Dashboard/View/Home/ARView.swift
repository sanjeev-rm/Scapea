//
//  ARView.swift
//  Scapea
//
//  Created by Sanjeev RM on 10/09/23.
//

import SwiftUI

struct ARView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            Image(systemName: "viewfinder")
                .font(.largeTitle.bold())
                .navigationTitle("AR")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            homeViewModel.showARView = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
        }
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView()
            .environmentObject(HomeViewModel())
    }
}
