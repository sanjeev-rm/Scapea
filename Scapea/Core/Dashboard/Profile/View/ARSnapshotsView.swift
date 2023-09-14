//
//  ARSnapshotsView.swift
//  Scapea
//
//  Created by Sanjeev RM on 13/09/23.
//

import SwiftUI

struct ARSnapshotsView: View {
    
    @State var gridMode = ARSnapshotsGridMode.medium
    @State var snapshots: [Snapshot] = Storage.getARSnapshots().snapshots
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: gridMode.width))], spacing: 16) {
                    ForEach(snapshots, id: \.self) { snapshot in
                        NavigationLink {
                            ARSnapshotsImageView(snapshot: snapshot)
                                .onDisappear {
                                    self.snapshots = Storage.getARSnapshots().snapshots
                                }
                        } label: {
                            Image(uiImage: convertImageDataToUIImage(imageData: snapshot.image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: gridMode.width, height: gridMode.height)
                                .cornerRadius(16)
                        }
                    }
                }
                .padding(16)
            }
            .navigationTitle("AR Snapshots")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        switch gridMode {
                        case .big: gridMode = .medium
                        case .medium: gridMode = .small
                        case .small: gridMode = .big
                        }
                    } label: {
                        gridMode.buttonImage
                    }
                }
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}



extension ARSnapshotsView {
    
    func convertImageDataToUIImage(imageData: Data) -> UIImage {
        if let uiimage = UIImage(data: imageData) {
            return uiimage
        } else {
            print("DEBUG: Couldn't convert image data to UIImage")
            return UIImage(systemName: "chevron.left.forwardslash.chevron.right")!
        }
    }
}

struct ARSnapshotsView_Previews: PreviewProvider {
    static var previews: some View {
        ARSnapshotsView()
    }
}
