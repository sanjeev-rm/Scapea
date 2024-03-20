//
//  MarketPlaceView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct MarketPlaceView: View {
    
    @State var query: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                HStack {
                    TextField("Search", text: $query)
                        .padding()
                        .background(.regularMaterial)
                        .cornerRadius(16, corners: [.allCorners])
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "hand.point.up.left.and.text")
                            .font(.largeTitle)
                    }
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
                        .background(.regularMaterial)
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
                    .padding()
                }
                
            }
            .navigationTitle("Market place")
            .background(APP_BACKGROUND_VIEW)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "cart")
                            .font(.title2)
                    }
                }
            }
        }
    }
}

#Preview {
    MarketPlaceView()
}
