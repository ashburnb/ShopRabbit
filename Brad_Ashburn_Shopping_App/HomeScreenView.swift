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
        HStack {
          Spacer()
          
          Button {
            showOnboardingView.toggle()
          } label: {
            ZStack {
              Circle()
                .fill(Color.green)
                .frame(width: 50, height: 50)
              Image(systemName: "list.dash")
                .resizable()
                .frame(width: 26, height: 20)
            }
            
          }
        }
        .padding(.trailing, 20)
        .padding(.top, 16)
        .foregroundColor(Color.white)
        
        
        Spacer()
      }
      
      VStack {
        Text("ShopRabbit")
          .fontWeight(.black)
          .font(.system(.largeTitle, design: .rounded))
          .foregroundColor(Color.white)
          .padding(.top, 20)
        
        Image("HomescreenRabbit")
          .resizable()
          .frame(width: 400, height: 400)
          .padding(.vertical, 30)
        
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
