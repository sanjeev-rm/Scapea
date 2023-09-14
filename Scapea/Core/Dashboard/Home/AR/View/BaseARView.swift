//
//  BaseARView.swift
//  Scapea
//
//  Created by Sanjeev RM on 11/09/23.
//

import SwiftUI

struct BaseARView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    @StateObject var baseARViewModel = BaseARViewModel()
    
    var body: some View {
        NavigationStack {
            CustomARViewRepresentable()
                .ignoresSafeArea()
                .overlay(alignment: .bottomLeading) {
                    HStack {
                        Button {
                            // Show options to add
                            baseARViewModel.showAddObjectOptions = true
                        } label: {
                            buttonLabel(systemName: "plus")
                        }
                        
                        Button {
                            // Capture picture of the view
                            baseARViewModel.showSnapshotClickedAlert()
                            ARManager.shared.actionStream.send(.takeAScreenshot)
                        } label: {
                            buttonLabel(systemName: "camera")
                        }
                        
                        Button {
                            // Remove all anchors
                            ARManager.shared.actionStream.send(.removeAllAnchors)
                        } label: {
                            buttonLabel(systemName: "trash")
                        }
                    }
                    .padding()
                }
                .overlay(alignment: .topTrailing) {
                    if baseARViewModel.snapShotClicked {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(.systemGreen))
                            .font(.title)
                            .padding()
                            .background(.regularMaterial)
                            .cornerRadius(16)
                            .padding()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            homeViewModel.showARView = false
                        } label: {
                            buttonLabel(systemName: "xmark")
                        }
                    }
                }
                .sheet(isPresented: $baseARViewModel.showAddObjectOptions) {
                    AddObjectView()
                        .presentationDetents([.medium])
                        .environmentObject(baseARViewModel)
                }
        }
    }
}



extension BaseARView {
    
    private func buttonLabel(systemName: String) -> some View {
        Image(systemName: systemName)
            .font(.title2)
            .frame(width: 30, height: 30)
            .padding()
            .background(.regularMaterial)
            .cornerRadius(16)
    }
}

struct BaseARView_Previews: PreviewProvider {
    static var previews: some View {
        BaseARView()
            .environmentObject(HomeViewModel())
    }
}
