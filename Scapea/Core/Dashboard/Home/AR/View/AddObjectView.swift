//
//  AddObjectView.swift
//  Scapea
//
//  Created by Sanjeev RM on 12/09/23.
//

import SwiftUI

struct AddObjectView: View {
    
    @EnvironmentObject var baseARViewModel: BaseARViewModel
    
    @State private var colors: [Color] = [.green, .red, .blue, .indigo, .yellow]
    
    var body: some View {
        NavigationStack {
            List {
                boxSection
                
                sphereSection
            }
            .navigationTitle("Select an object")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem {
                    Button {
                        // Dismiss the view
                        baseARViewModel.showAddObjectOptions = false
                    } label: {
                        Text("cancel")
                    }
                }
            }
        }
    }
}



extension AddObjectView {
    
    private var boxSection: some View {
        Section("Box") {
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(colors, id: \.self) { color in
                        Button {
                            ARManager.shared.actionStream.send(.placeShapeObject(.block, color: color))
                            baseARViewModel.showAddObjectOptions = false
                        } label: {
                            color
                                .frame(width: 100, height: 100)
                                .foregroundColor(.clear)
                                .background(.thinMaterial)
                                .cornerRadius(16)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .listRowSeparator(.hidden, edges: .bottom)
    }
    
    private var sphereSection: some View {
        Section("Sphere") {
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(colors, id: \.self) { color in
                        Button {
                            ARManager.shared.actionStream.send(.placeShapeObject(.sphere, color: color))
                            baseARViewModel.showAddObjectOptions = false
                        } label: {
                            color
                                .frame(width: 100, height: 100)
                                .foregroundColor(.clear)
                                .background(.thinMaterial)
                                .cornerRadius(16)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .listRowSeparator(.hidden, edges: .bottom)
    }
}

struct AddObjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddObjectView()
    }
}
