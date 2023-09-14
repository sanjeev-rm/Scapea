//
//  ARSnapshotsImageView.swift
//  Scapea
//
//  Created by Sanjeev RM on 13/09/23.
//

import SwiftUI

struct ARSnapshotsImageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var snapshot: Snapshot
    
    var uiImage: UIImage {
        UIImage(data: snapshot.image) ?? UIImage()
    }
    
    @State var showDeleteConfirmation: Bool = false
    
    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .scaledToFill()
            .toolbar {
                ToolbarItem(placement: .destructiveAction) {
                    Button(role: .destructive) {
                        showDeleteConfirmation = true
                    } label: {
                        Image(systemName: "trash")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    ShareLink(item: Image(uiImage: uiImage), preview: SharePreview("AR Snapshot", image: Image(uiImage: uiImage)))
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .toolbarBackground(Color(.systemBackground), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .confirmationDialog("", isPresented: $showDeleteConfirmation) {
                Button("Delete", role: .destructive) {
                    Storage.deleteSnapshot(snapshot)
                    self.presentationMode.wrappedValue.dismiss()
                }
            } message: {
                Text("Are you sure you want to Delete Snapshot?")
            }
    }
}

struct ARSnapshotsImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ARSnapshotsImageView(snapshot: Snapshot(image: Data()))
        }
    }
}
