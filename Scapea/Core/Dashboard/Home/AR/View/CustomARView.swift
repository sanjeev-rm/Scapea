//
//  CustomARView.swift
//  Scapea
//
//  Created by Sanjeev RM on 11/09/23.
//

import Foundation
import ARKit
import RealityKit
import SwiftUI
import Combine

class CustomARView: ARView {
    
    let coachingOverlay = ARCoachingOverlayView()
    
    private var cancellbles: Set<AnyCancellable> = []
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        // Add ARCoachingOverlayView
        self.addCoaching()
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        self.session.run(config, options: [])
        
        subscribeToActionStream()
    }
}



extension CustomARView {
    
    func subscribeToActionStream() {
        ARManager.shared
            .actionStream
            .sink { [weak self] action in
                
                switch action {
                case .placePlantObject(let plant):
                    self?.placePlantObject(plant: plant)
                case .placeShapeObject(let shape, let color):
                    self?.placeShapeObject(shape: shape, color: color)
                case .takeAScreenshot:
                    self?.snapshot(saveToHDR: false) { image in
                        print("DEBUG: Taken Screenshot")
                        let imageData = image?.pngData()
                        Storage.addARSnapShot(imageData: imageData)
                    }
                case .removeAllAnchors:
                    self?.scene.anchors.removeAll()
                }
            }
            .store(in: &cancellbles)
    }
    
    func placeShapeObject(shape: ARObjectShape, color: Color) {
        var shapeObjectMesh: MeshResource
        switch shape {
        case .block: shapeObjectMesh = MeshResource.generateBox(size: 0.1)
        case .sphere: shapeObjectMesh = MeshResource.generateSphere(radius: 0.1)
        }
        
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: shapeObjectMesh, materials: [material])
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
        
        entity.generateCollisionShapes(recursive: true)
        self.installGestures([.all], for: entity)
    }
    
    func placePlantObject(plant: ARObjectPlant) {
        switch plant {
        case .tulip:
            guard let tulipAnchor = try? Tulip.load_Tulip() else { return }
            self.scene.anchors.append(tulipAnchor)
            guard let tulipEntity = tulipAnchor.tulip else { return }
            tulipEntity.generateCollisionShapes(recursive: true)
            self.installGestures([.all], for: tulipEntity as! HasCollision)
        }
    }
}



extension CustomARView: ARCoachingOverlayViewDelegate {
    
    func addCoaching() {
        coachingOverlay.delegate = self
        coachingOverlay.session = self.session
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.center = .zero
        coachingOverlay.goal = .horizontalPlane
        self.addSubview(coachingOverlay)
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        // This method will be called when the coaching goal will be detected
        print("DEBUG: Plane detected")
        coachingOverlayView.removeFromSuperview()
    }
}
