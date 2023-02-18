//
//  OnboardingView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct OnboardingView: View {
  @Binding var showOnboardingView: Bool
  var onboardingData = OnboardingModel()

  var body: some View {
    ZStack {
      Color.green
        .ignoresSafeArea()
            
      VStack {
        OnboardingTitleView(text: "Onboarding")
          .padding(.top, 18)
        
        VStack(alignment: .leading, spacing: 4.0) {
          Text("A whimiscal shopping experience.")
            .padding(.vertical, 10)
          
          OnboardingBodyTitleView(text: "Essential App Features")
          
          ForEach(onboardingData.mustHaveFeatures, id: \.self) {
            Text($0)
              .multilineTextAlignment(.leading)
          }
        }
        .font(.system(.headline, design: .rounded))
        .padding(.horizontal, 20)
        
        Spacer()
        
        HStack {
          Spacer()
          GoBackToHomescreenButtonView(showOnboardingView: $showOnboardingView)
          Spacer()
        } // end of HStack
        .padding(.top, 10)
        .padding(.bottom, 40)
      }
    } // end of ZStack
    .foregroundColor(Color.white)
  }
}


struct OnboardingView_Previews: PreviewProvider {
  static let showOnboardingView = Binding.constant(false)
  
  static var previews: some View {
    OnboardingView(showOnboardingView: showOnboardingView)
  }
}
