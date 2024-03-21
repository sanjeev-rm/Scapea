//
//  CuratedKitsForm.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct CuratedKitsForm: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var gardeningGoal: GardeningGoal = .hobby
    @State var location: UserLocation = .mumbai
    @State var noOfWorkingDays: Int = 0
    @State var needPlantMonitoring: Bool = true
    @State var showGeneratedKitView: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Text("Discover Your Perfect Plant Match with Scapea's Curated Kits, Customized to Your Lifestyle and Locale. Answer a few questions to get your perfect match")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .padding()
                
//                Text("Answer a few questions to get your perfect match")
//                    .font(.callout)
//                    .foregroundStyle(.secondary)
                
                Divider()
                
                ScrollView {
                    VStack(spacing: 32) {
                        HStack {
                            Text("What are you gardening for?")
                                .font(.callout)
                            Spacer()
                            Picker("", selection: $gardeningGoal) {
                                ForEach(GardeningGoal.allCases, id: \.self) { goal in
                                    Text(goal.rawValue)
                                }
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Where do you need to plant?")
                                .font(.callout)
                            Spacer()
                            Picker("", selection: $location) {
                                ForEach(UserLocation.allCases, id: \.self) { location in
                                    Text(location.rawValue)
                                }
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Working days ?")
                                .font(.callout)
                            Spacer()
                            Text(noOfWorkingDays.formatted())
                                .font(.title3.monospaced())
                            Stepper("", value: $noOfWorkingDays, in: 0...7)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Do you want plant monitoring ?")
                                .font(.callout)
                            Spacer()
                            Toggle(isOn: $needPlantMonitoring, label: {})
                                .frame(width: 100)
                        }
                        
                    }.padding()
                }
                .scrollIndicators(.hidden)
                
                Spacer()
                
                ScapeaButton(title: "Generate kit", showProgress: .constant(false)) {
                    showGeneratedKitView = true
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(APP_BACKGROUND_VIEW)
            .navigationTitle("Curated Kits")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .navigationDestination(isPresented: $showGeneratedKitView) {
                GeneratedKitView()
            }
        }
    }
}

#Preview {
    CuratedKitsForm()
}
