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
            
            AngularGradient(colors: [Color(.systemGreen), Color(.systemFill)], center: .bottomTrailing)
                .ignoresSafeArea()
            
            content
        }
        .fullScreenCover(isPresented: $homeViewModel.showARView) {
            ARView()
                .environmentObject(homeViewModel)
        }
        .fullScreenCover(isPresented: $homeViewModel.showTriviaView) {
            TriviaView()
                .environmentObject(homeViewModel)
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
        VStack(spacing: 32) {
            headline
            quote
        }
        .padding()
    }
    
    private var headline: some View {
        Text("Scapea")
            .font(.largeTitle.bold())
    }
    
    private var quote: some View {
        HStack(alignment: .top) {
            Image(systemName: "quote.opening")
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
                .font(.body)
                .multilineTextAlignment(.leading)
        }
        .fontWeight(.ultraLight)
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
                                case .chat: homeViewModel.showTriviaView = true
                                default: break
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
