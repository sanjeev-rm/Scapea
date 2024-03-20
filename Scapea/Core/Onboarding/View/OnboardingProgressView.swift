//
//  OnboardingProgressView.swift
//  Scapea
//
//  Created by Sanjeev RM on 03/09/23.
//

import SwiftUI

struct OnboardingProgressView: View {
    
    var currentOnboardingStep: OnboardingStep
    var body: some View {
        HStack {
            ForEach(OnboardingStep.allCases, id: \.self) { onboardingStep in
                let isPresenting = (currentOnboardingStep == onboardingStep)
                RoundedRectangle(cornerRadius: 32)
                    .frame(width: 10, height: 10)
                    .foregroundColor(isPresenting ? .secondary : .white.opacity(0.7))
            }
        }
    }
}

struct OnboardingProgressView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingProgressView(currentOnboardingStep: .one)
    }
}
