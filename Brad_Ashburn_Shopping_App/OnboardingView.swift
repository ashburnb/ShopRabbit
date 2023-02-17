//
//  OnboardingView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct OnboardingView: View {
  @Binding var showOnboardingView: Bool

  var body: some View {
    ZStack {
      Color.mint
        .ignoresSafeArea()
      
      VStack {
        HStack {
          Spacer()
          
          Button {
            showOnboardingView.toggle()
          } label: {
            Text("Back")
          }
        }
        .padding()
        
        Spacer()
      }
      
      VStack {
        Text("Onboarding")
          .font(.largeTitle)
          .foregroundColor(Color.white)
        
        Spacer()
      }
    }
    
  }
  
}


struct OnboardingView_Previews: PreviewProvider {
  static let showOnboardingView = Binding.constant(false)
  
  static var previews: some View {
    OnboardingView(showOnboardingView: showOnboardingView)
  }
}
