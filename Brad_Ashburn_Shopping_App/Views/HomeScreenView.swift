//
//  HomeScreenView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct HomescreenView: View {
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass
  
  var body: some View {
    ZStack {
      Color("HomescreenColor")
        .ignoresSafeArea()
      
      VStack {
        HomescreenTitleView(text: "Shop Rabbit")
          .padding(.top, Constants.Homescreen.titleTextTopPadding)
        
        // portrait orientation
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
          Image("HomescreenRabbit")
            .resizable()
            .scaledToFit()
        } else {
        // landscape orientation
          Image("HomescreenRabbit")
            .resizable()
            .scaledToFit()
        }
      } // end of VStack
      .padding(.bottom, Constants.Homescreen.bodyBottomPadding)
      
      
    } // end of ZStack
  } // end of body property
}


struct HomescreenView_Previews: PreviewProvider {
  static var previews: some View {
    HomescreenView()
  }
}
