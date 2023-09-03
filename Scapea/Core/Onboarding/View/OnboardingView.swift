//
//  OnboardingView.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State var currentStep: OnboardingStep = .one
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            OnboardingStepView(onboardingStep: currentStep)
            
            VStack(alignment: .trailing) {
                
                if let lastStep = OnboardingStep.lastStep,
                   currentStep != lastStep {
                    skipButton
                }
                
                Spacer()
                
                HStack {
                    OnboardingProgressView(currentOnboardingStep: currentStep)
                    
                    Spacer()
                    
                    nextButton
                }
            }
            .padding(27)
        }
    }
}



extension OnboardingView {
    
    private var skipButton: some View {
        Button {
            // Skip to login / sign up
            authenticationViewModel.showOnboarding = false
        } label: {
            Text("Skip")
                .underline()
        }
        .foregroundColor(.black)
    }
    
    private var nextButton: some View {
        Button {
            // Change Onboarding Step
            switch currentStep {
            case .one:
                withAnimation(.easeInOut) {
                    currentStep = .two
                }
            case .two:
                withAnimation(.easeInOut) {
                    currentStep = .three
                }
            case .three:
                // Dismiss Onboarding
                withAnimation(.easeInOut) {
                    authenticationViewModel.showOnboarding = false
                }
            }
        } label: {
            Image(systemName: (currentStep == .three) ? "checkmark" : "chevron.right")
                .foregroundColor(.black)
                .font(.title.bold())
                .padding(22)
                .background(Color.white)
                .clipShape(Circle())
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(AuthenticationViewModel())
    }
}
