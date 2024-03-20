//
//  DashboardView.swift
//  Scapea
//
//  Created by Sanjeev RM on 05/09/23.
//

import SwiftUI

struct DashboardView: View {
    
    @State private var currentTab = 2
    
    var body: some View {
        TabView(selection: $currentTab) {
            MyGardenView()
                .tabItem {
                    Image(systemName: "camera.macro")
                }
                .tag(1)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(2)
            
            MarketPlaceView()
                .tabItem {
                    Image(systemName: "cart")
                }
                .tag(3)
            
            CommunityView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                }
                .tag(4)
        }
        .onAppear {
            currentTab = 2
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
