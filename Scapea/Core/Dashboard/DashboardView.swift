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
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(1)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
                .tag(3)
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
