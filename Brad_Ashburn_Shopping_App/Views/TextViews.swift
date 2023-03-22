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
      .font(.system(size: Constants.Homescreen.titleTextSize, design: .rounded))
      .foregroundColor(Color.white)
  }
}


struct DateAttributedStringView: View {
  var dateAttributedString: AttributedString {
    var customDateDisplay = Date.now.formatted(.dateTime.hour().minute().attributed)
    
    // modifies color of hour
    let hour = AttributeContainer.dateField(.hour)
    let hourStyle = AttributeContainer.foregroundColor(Color("HomescreenColor"))
    
    // modifies color of minutes
    let minute = AttributeContainer.dateField(.minute)
    let minuteStyle = AttributeContainer.foregroundColor(Color("HomescreenColor"))
    
    // replace the default String attributes with custom ones
    customDateDisplay.replaceAttributes(hour, with: hourStyle)
    customDateDisplay.replaceAttributes(minute, with: minuteStyle)
    
    // all computed properties must return their result
    return customDateDisplay
  }
  
  var body: some View {
    HStack {
      Spacer()
      Text("\(dateAttributedString)")
        .padding(.vertical, Constants.ShoppingCart.attributedStringPadding)
      Spacer()
    }
  }
  
}


struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color(.lightGray).ignoresSafeArea()
      VStack(spacing: 20) {
        HomescreenTitleView(text: "ShopRabbit")
        DateAttributedStringView()
      }
    }
  }
}
