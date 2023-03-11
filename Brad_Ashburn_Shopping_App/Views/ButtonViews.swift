//
//  ButtonViews.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/11/23.
//

import SwiftUI

struct CategoryTextView: View {
  let categoryName: String
  let backgroundColor: Color
  
  var body: some View {
    Text("\(categoryName)")
      .padding()
      .frame(
        width: Constants.Homescreen.hopOnInButtonWidth,
        height: Constants.Homescreen.hopOnInButtonHeight
      )
      .background(backgroundColor)
      .font(.system(.headline, design: .rounded, weight: .heavy))
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
  }
}


struct ButtonViews_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.gray
        .ignoresSafeArea()
      
      VStack(spacing: 30) {
        CategoryTextView(categoryName: "Jewelry", backgroundColor: .orange)
        CategoryTextView(categoryName: "Women's\nClothing", backgroundColor: .red)
      }
    }
  }
}

