//
//  ButtonViews.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/17/23.
//

import SwiftUI

struct HopOnInButtonView: View {
  @Binding var showInventoryView: Bool
  
  var body: some View {
    Button {
      showInventoryView.toggle()
    } label: {
      Text("Hop on in")
        .padding()
        .frame(
          width: Constants.Homescreen.goToOnboardingViewButtonWidth,
          height: Constants.Homescreen.goToOnboardingViewButtonHeight
        )
        .background(Color("OnboardingColor"))
        .font(.system(.title2, design: .rounded, weight: .heavy))
        .foregroundColor(Color.white)
        .clipShape(
          Capsule()
        )
        .shadow(
          radius: Constants.Homescreen.shadow,
          x: Constants.Homescreen.shadow,
          y: Constants.Homescreen.shadow
        )
        .overlay(
          Capsule()
            .strokeBorder(
              Color.white,
              lineWidth: Constants.Homescreen.buttonLineWidth
            )
        )
    } // end of Button
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
        .frame(
          width: Constants.Onboarding.goBackToHomescreenButtonWidth,
          height: Constants.Onboarding.goBackToHomescreenButtonHeight
        )
    }
  }
}


struct AboutButtonView: View {
  @Binding var showOnboardingView: Bool
  
  var body: some View {
    Button {
      showOnboardingView.toggle()
    } label: {
      Image(systemName: "questionmark.circle")
        .resizable()
        .frame(
          width: Constants.Onboarding.goBackToHomescreenButtonWidth,
          height: Constants.Onboarding.goBackToHomescreenButtonHeight
        )
        .foregroundColor(.white)
    }
  }
}


struct ButtonViews_Previews: PreviewProvider {
  static let showOnboardingView = Binding.constant(false)
  static let showInventoryView = Binding.constant(false)
  
  static var previews: some View {
    VStack(spacing: 30) {
      HopOnInButtonView(showInventoryView: showInventoryView)
      GoBackToHomescreenButtonView(showOnboardingView: showOnboardingView)
      AboutButtonView(showOnboardingView: showOnboardingView)
    }
  }
}

