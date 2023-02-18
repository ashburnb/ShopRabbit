//
//  ButtonViews.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/17/23.
//

import SwiftUI

struct HopOnInButtonView: View {
  @Binding var showOnboardingView: Bool
  
  var body: some View {
    Button {
      showOnboardingView.toggle()
    } label: {
      Text("Hop on in")
        .padding()
        .frame(width: 160, height: 60)
        .background(Color("OnboardingColor"))
        .font(.system(.title2, design: .rounded, weight: .heavy))
        .foregroundColor(Color.white)
        .clipShape(
          Capsule()
        )
        .shadow(
          radius: Constants.General.homescreenShadow,
          x: Constants.General.homescreenShadow,
          y: Constants.General.homescreenShadow)
        .overlay(
          Capsule()
            .strokeBorder(Color.white, lineWidth: Constants.General.homescreenButtonLineWidth)
        )
    }
  }
}


struct GoBackToHomescreenButtonView: View {
  @Binding var showOnboardingView: Bool
  
  var body: some View {
    Button {
      showOnboardingView.toggle()
    } label: {
      Image(systemName: "arrow.down.circle")
        .resizable()
        .frame(width: 40, height: 40)
    }
  }
}


struct ButtonViews_Previews: PreviewProvider {
  
  static var previews: some View {
    VStack(spacing: 30) {
      HopOnInButtonView(showOnboardingView: Binding.constant(false))
      GoBackToHomescreenButtonView(showOnboardingView: Binding.constant(false))
    }
  }
  
}

