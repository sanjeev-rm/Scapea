//
//  HomeView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            
            APP_BACKGROUND_VIEW
            
            content
        }
        .fullScreenCover(isPresented: $homeViewModel.showARView) {
            BaseARView()
                .environmentObject(homeViewModel)
        }
        .fullScreenCover(isPresented: $homeViewModel.showSettingsView) {
            ProfileView()
        }
        .fullScreenCover(isPresented: $homeViewModel.showCuratedKitsView) {
            CuratedKitsForm()
        }
        .fullScreenCover(isPresented: $homeViewModel.showScapediaView) {
            ScapediaView()
        }
    }
}



extension HomeView {
    
    private var content: some View {
        VStack(spacing: 32) {
            headlineAndQuote
            
            options
            
            Spacer()
        }
    }
    
    private var headlineAndQuote: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                settingsButton
            }
            headline
            quote
        }
        .padding()
        .padding(.horizontal, 8)
    }
    
    private var settingsButton: some View {
        Button {
            homeViewModel.showSettingsView = true
        } label: {
            Image(systemName: "gearshape.fill")
                .font(.title2)
        }
    }
    
    private var headline: some View {
        Text("Greetings")
            .font(.largeTitle.bold())
            .foregroundColor(.accentColor)
        
    }
    
    private var quote: some View {
        HStack(alignment: .top) {
//            Image(systemName: "quote.opening")
            Text("Welcome to the lush world of Scapea! Where each tap takes you one step closer to your green haven.")
                .font(.callout)
                .multilineTextAlignment(.leading)
        }
        .fontWeight(.light)
        .foregroundStyle(.secondary)
    }
    
    private var options: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(ScapeaAction.allCases, id: \.self) { action in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
                        action.cardView
                            .onTapGesture {
                                switch action {
                                case .ar: homeViewModel.showARView = true
                                case .curatedKits: homeViewModel.showCuratedKitsView = true
                                case .scapedia: homeViewModel.showScapediaView = true
                                }
                            }
                            .scaleEffect(CGSize(width: scale, height: scale))
                            .padding(.vertical)
                    }
                    .frame(width: 250, height: 450)
                }
            }
            .padding(.horizontal, UIScreen.main.bounds.width / 2 - 160)
        }
    }
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x - 16)
        if diff < 400 {
            scale = 1 + (100 - diff) / 1000
        }
        return scale
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
