//
//  TextViews.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/17/23.
//

import SwiftUI

struct HomescreenTitleView: View {
  let text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.black)
      .font(.system(size: 50, design: .rounded))
      .foregroundColor(Color.white)
      .padding(.top, 20)
  }
}

struct OnboardingTitleView: View {
  let text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.black)
      .font(.system(.largeTitle, design: .rounded))
      .padding(.top, 20)
  }
}

struct OnboardingBodyTitleView: View {
  let text: String
  
  var body: some View {
    Text(text)
      .font(.title2)
      .bold()
      .padding(.bottom)
  }
}






struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 20) {
      HomescreenTitleView(text: "ShopRabbit")
      OnboardingTitleView(text: "Onboarding")
      OnboardingBodyTitleView(text: "Essential App Features")
    } // end of VStack
  }
}
