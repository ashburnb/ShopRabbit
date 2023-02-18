//
//  HomeScreenView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct HomeScreenView: View {
  @State private var showOnboardingView = false
  
  var body: some View {
    ZStack {
      Color("HomescreenColor")
        .ignoresSafeArea()
      
      VStack {
        Text("ShopRabbit")
          .fontWeight(.black)
          .font(.system(size: 50, design: .rounded))
          .foregroundColor(Color.white)
          .padding(.top, 20)
        
        Image("HomescreenRabbit")
          .resizable()
          .scaledToFit()
        
        Spacer()
        
        HopOnInButtonView(showOnboardingView: $showOnboardingView)
          .padding(.bottom, 22)

      }
    }
    .fullScreenCover(isPresented: $showOnboardingView) {
      OnboardingView(showOnboardingView: $showOnboardingView)
    }
    
    
    
    
  } // end of body property
  
}

struct HomeScreenView_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreenView()
  }
}
