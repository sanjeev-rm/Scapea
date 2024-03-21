//
//  GetServicesView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct GetServicesView: View {
    
    @State var selectedService: GardenService = .none
    @State var showServiceDetails: Bool = false
    
    var body: some View {
        ScrollView{
            if #available(iOS 17.0, *) {
                services
                    .onChange(of: selectedService) {
                        showServiceDetails = true
                    }
            } else {
                services
                    .onChange(of: selectedService, perform: { value in
                        showServiceDetails = true
                    })
                
            }
        }
        .sheet(isPresented: $showServiceDetails) {
            ServiceDetailsView()
                .presentationDetents([.medium])
        }
    }
}

extension GetServicesView {
    
    private var services: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Get Services")
                .font(.largeTitle.bold())
                .foregroundColor(.accentColor)
            
            VStack(spacing: 32) {
                HStack(spacing: 32) {
                    GardenServiceView(gardenService: .lawnCare)
                        .onTapGesture { showServiceDetails = true }
                    Spacer()
                    GardenServiceView(gardenService: .weeding)
                        .onTapGesture { showServiceDetails = true }
                    Spacer()
                    GardenServiceView(gardenService: .pruningAndTrimming)
                        .onTapGesture { showServiceDetails = true }
                }
                HStack(spacing: 32) {
                    GardenServiceView(gardenService: .pestAndDiseaseControl)
                        .onTapGesture { showServiceDetails = true }
                    Spacer()
                    GardenServiceView(gardenService: .landscapeDesigning)
                        .onTapGesture { showServiceDetails = true }
                    Spacer()
                    GardenServiceView(gardenService: .consultationAndAdvice)
                        .onTapGesture { showServiceDetails = true }
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            HStack {
                Image(.spriteWomen1)
                    .aspectRatio(contentMode: .fit)
                Text("Sit back, relax and watch your garden flourish with Scapea's maintenance services!")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    GetServicesView()
}
