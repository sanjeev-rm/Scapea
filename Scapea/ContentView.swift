//
//  ContentView.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            AngularGradient(colors: [Color(.systemGreen), Color(.systemFill)], center: .bottomTrailing)
                .ignoresSafeArea()
            Rectangle()
                .background(.thinMaterial)
                .overlay {
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text("Hello, world!")
                    }
                }
            .padding()
//            .background(.thinMaterial)
            .cornerRadius(16)
            
        }
        
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            AngularGradient(colors: [Color(.systemGreen), Color(.systemFill)], center: .bottomTrailing)
                .ignoresSafeArea()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
