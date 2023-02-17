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
      Color.green
        .ignoresSafeArea()

      VStack {
        HStack {
          Spacer()
          
          Button {
            showOnboardingView.toggle()
          } label: {
            Text("Onboarding")
          }
        }
        .padding()
        
        
        Spacer()
      }
      
      VStack {
        Text("Shopping")
          .font(.largeTitle)
          .foregroundColor(Color.white)
        
        Spacer()
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
