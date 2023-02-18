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
        .background(.green)
        .font(.system(.title2, design: .rounded, weight: .heavy))
        .foregroundColor(Color.white)
        .clipShape(
          Capsule()
        )
        .shadow(radius: 1.0, x: 1.0, y: 1.0)
        .overlay(
          Capsule()
            .strokeBorder(Color.white, lineWidth: 3.0)
        )
    }
  }
}





struct ButtonViews_Previews: PreviewProvider {
  static var previews: some View {
    HopOnInButtonView(showOnboardingView: Binding.constant(false))
  }
}
