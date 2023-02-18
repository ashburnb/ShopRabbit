//
//  HomeScreenView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct HomescreenView: View {
  @State private var showOnboardingView = false
  
  var body: some View {
    ZStack {
      Color("HomescreenColor")
        .ignoresSafeArea()
      
      VStack {
        HomescreenTitleView(text: "ShopRabbit")
        
        Image("HomescreenRabbit")
          .resizable()
          .scaledToFit()
        
        Spacer()
        
        HopOnInButtonView(showOnboardingView: $showOnboardingView)
          .padding(.bottom, 22)
      }
    } // end of ZStack
    .fullScreenCover(isPresented: $showOnboardingView) {
      OnboardingView(showOnboardingView: $showOnboardingView)
    }
    
  } // end of body property
  
}


struct HomescreenView_Previews: PreviewProvider {
  static var previews: some View {
    HomescreenView()
  }
}
