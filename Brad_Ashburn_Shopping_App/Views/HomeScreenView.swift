//
//  HomeScreenView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct HomescreenView: View {
  @State private var showOnboardingView = false
  @State private var showInventoryView = false
  
  var body: some View {
    ZStack {
      Color("HomescreenColor")
        .ignoresSafeArea()
      
      VStack {
        HomescreenTitleView(text: "Shop Rabbit")
          .padding(.top, Constants.Homescreen.titleTextTopPadding)
        
        Image("HomescreenRabbit")
          .resizable()
          .scaledToFit()
        
        Spacer()
        
        HomescreenBodyView(text: "Welcome [username]")
          .padding(.bottom, Constants.Homescreen.bodyBottomPadding)
          
        HStack {
          AboutButtonView(showOnboardingView: $showOnboardingView)
            .padding(.bottom, Constants.Homescreen.aboutButtonBottomPadding)
            .padding(.trailing, Constants.Homescreen.aboutButtonBottomTrailing)
          HopOnInButtonView(showInventoryView: $showInventoryView)
            .padding(.bottom, Constants.Homescreen.buttonPadding)
        }
      } // end of VStack
    } // end of ZStack
    .fullScreenCover(isPresented: $showOnboardingView) {
      OnboardingView(showOnboardingView: $showOnboardingView)
    }
    .fullScreenCover(isPresented: $showInventoryView) {
      InventoryView(showInventoryView: $showInventoryView)
    }
  } // end of body property
}


struct HomescreenView_Previews: PreviewProvider {
  static var previews: some View {
    HomescreenView()
  }
}
