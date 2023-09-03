//
//  OnboardingStepView.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct OnboardingStepView: View {
    
    var onboardingStep: OnboardingStep
    
    var body: some View {
        VStack(spacing: 44) {
            ZStack {
                Rectangle()
                    .foregroundColor(onboardingStep.secondaryColor)
                    .cornerRadius(64, corners: [.bottomLeft, .bottomRight])
                    .shadow(radius: 32)
                    .frame(height: UIScreen.main.bounds.height / 2)
                
                onboardingStep.image
                    .resizable()
                    .frame(width: 250, height: 250)
            }
            
            VStack(spacing: 16) {
                Text(onboardingStep.title)
                    .font(.title.bold())
                Text(onboardingStep.description)
                    .font(.body.weight(.light))
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.black)
            .padding(27)
            
            Spacer()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(onboardingStep.primaryColor)
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStepView(onboardingStep: .one)
    }
}
