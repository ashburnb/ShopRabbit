//
//  HomeScreenView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

/*
 The goal is to implement a launch screen animation that will transition to this view. I looked up tutorials on how to do that and they were pretty complex for my current level.
 */

struct HomescreenView: View {
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @State private var scale = 1.0
  
  var body: some View {
    ZStack {
      // portrait orientation
      if horizontalSizeClass == .compact && verticalSizeClass == .regular {
        Color("HomescreenColor")
          .edgesIgnoringSafeArea(.top)
      } else {
        // landscape orientation
        Color("HomescreenColor")
          .edgesIgnoringSafeArea(.horizontal)
      }
      
      VStack {
        HomescreenTitleView(text: "Shop Rabbit")
          .padding(.top, Constants.Homescreen.titleTextTopPadding)
        
        Image("HomescreenRabbit")
          .resizable()
          .scaledToFit()
          .scaleEffect(scale)
          .onAppear {
            let animate = Animation.easeInOut(duration: 0.5)
            withAnimation(animate) {
              scale = 1.2
            }
          }
      } // end of VStack
      
    } // end of ZStack
  } // end of body property
}


struct HomescreenView_Previews: PreviewProvider {
  static var previews: some View {
    HomescreenView()
  }
}
