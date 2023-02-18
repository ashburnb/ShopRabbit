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
          .frame(width: 400, height: 400)
          .padding(.vertical, 30)
        
        Spacer()
        
        Button {
          showOnboardingView.toggle()
        } label: {
          Text("Hop on in!")
            .padding()
            .frame(width: 160, height: 60)
            .background(.green)
            .font(.system(.title2, design: .rounded, weight: .heavy))
            .foregroundColor(Color.white)
            .clipShape(
              Capsule()
            )
            .shadow(radius: 3.0, x: 2.0, y: 2.0)
            .overlay(
              Capsule()
                .strokeBorder(Color.white, lineWidth: 3.0)
            )
        }

        
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
