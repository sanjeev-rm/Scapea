//
//  HomeView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Text("Hello, World!")
                    .font(.system(size: 27, weight: .ultraLight, design: .monospaced))
                    .padding(8)
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
