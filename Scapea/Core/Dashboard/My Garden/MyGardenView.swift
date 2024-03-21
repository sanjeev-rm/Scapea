//
//  MyGardenView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct MyGardenView: View {
    
    @State var contentType: ContentType = .myPlants
    
    enum ContentType: String, CaseIterable {
        case myPlants = "My Plants"
        case services = "Get Services"
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    Divider()
                    switch contentType {
                    case .myPlants: MyPlantsView()
                    case .services: GetServicesView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(APP_BACKGROUND_VIEW)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("", selection: $contentType) {
                        ForEach(ContentType.allCases, id: \.self) { contentType in
                            Text(contentType.rawValue).tag(contentType)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "leaf.circle")
                            .font(.title2)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                UISegmentedControl.appearance().selectedSegmentTintColor = .tertiarySystemGroupedBackground
                UISegmentedControl.appearance().backgroundColor = .clear
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(resource: .accent)], for: .normal)
            }
        }
    }
}

#Preview {
    MyGardenView()
}
