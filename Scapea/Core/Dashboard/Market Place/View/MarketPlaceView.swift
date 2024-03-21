//
//  MarketPlaceView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct MarketPlaceView: View {
    
    @State var query: String = ""
    @State var showCuratedKitsView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                HStack {
                    TextField("Search", text: $query)
                        .padding()
                        .background(.regularMaterial)
                        .cornerRadius(16, corners: [.allCorners])
                    
//                    Button {
//                        showCuratedKitsView = true
//                    } label: {
//                        Image(systemName: "hand.point.up.left.and.text")
//                            .font(.largeTitle)
//                    }
                }
                .padding()
                
                HStack {
                    
                    VStack(spacing: 32) {
                        
                        VStack(spacing: 32) {
                            Button {
                                
                            } label: {
                                Image(systemName: "camera.macro")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "light.beacon.max.fill")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "hammer.fill")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "shower.handheld.fill")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "ellipsis")
                                    .font(.title)
                            }
                        }
                        .padding()
                        .padding([.vertical])
                        .background(.thinMaterial)
                        .cornerRadius(16, corners: [.bottomRight, .topRight])
                        
                        Spacer()
                    }
                    .font(.title2)
                    
                    Spacer()
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(SAMPLE_ITEMS, id: \.title) { item in
                                MarketItemView(item: item)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding()
                }
                
            }
            .navigationTitle("Market place")
            .navigationBarTitleDisplayMode(.inline)
            .background(APP_BACKGROUND_VIEW)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "cart")
                            .font(.title2)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showCuratedKitsView = true
                    } label: {
                        Image(systemName: "hand.point.up.left.and.text")
                            .font(.title)
                    }
                }
            }
            .fullScreenCover(isPresented: $showCuratedKitsView) {
                CuratedKitsForm()
            }
        }
    }
}

#Preview {
    MarketPlaceView()
}
