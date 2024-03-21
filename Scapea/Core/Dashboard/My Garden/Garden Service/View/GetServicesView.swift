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
            
            VStack(spacing: 32) {
                HStack(spacing: 32) {
                    AvatarView(scapeaAvatar: .one, currentlySelectedAvatar: $selectedService)
                    AvatarView(scapeaAvatar: .two, currentlySelectedAvatar: $selectedService)
                    AvatarView(scapeaAvatar: .three, currentlySelectedAvatar: $selectedService)
                }
                HStack(spacing: 32) {
                    AvatarView(scapeaAvatar: .four, currentlySelectedAvatar: $selectedService)
                    AvatarView(scapeaAvatar: .five, currentlySelectedAvatar: $selectedService)
                    AvatarView(scapeaAvatar: .six, currentlySelectedAvatar: $selectedService)
                }
            }
            
            Divider()
            
            HStack {
                Image(.spriteWomen1)
                    .aspectRatio(contentMode: .fit)
                Text("Sit back, relax and watch your garden flourish with Scapea's maintenance services!")
                    .font(.callout)
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
