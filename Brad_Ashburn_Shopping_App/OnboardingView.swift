//
//  OnboardingView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct OnboardingView: View {
  @Binding var showOnboardingView: Bool
  let mustHaveFeatures: [String] = [
    "1. Catalog items are displayed in a list",
    "2. Catalog data is fetched from an API and saved in the app",
    "3. Users can select list items and add them to a shopping cart",
    "4. A checkout screen will display the items with their associated prices and total shopping car amount",
    "5. The Checkout screen will have an option to apply a discount code",
    "6. Users can add reviews for purchased items including optional photos taken using their phone camera"
  ]
  
  let niceToHaveFeatures: [String] = [
    "1. Login system for User accounts",
    "2. Users can search for items",
    "3. Searched items can be sorted by various properties (rating, newest, etc)",
    "4. Make product pages look beautiful and easy to learn about product",
    "5. Users can create Wishlists for later",
    "6. User can create a Baby/Wedding Registry that other Users can search for",
    "7. Purchasing an item off the registry, updates the registry saying purchased",
    "8. Gamification - badges, challenges, ways to earn discounts"
  ]
  
  var body: some View {
    ZStack {
      Color.green
        .ignoresSafeArea()
      
      //      VStack {
      //        HStack {
      //          Spacer()
      //
      //          Button {
      //            showOnboardingView.toggle()
      //          } label: {
      //            Image(systemName: "arrow.down.circle")
      //              .resizable()
      //              .frame(width: 40, height: 40)
      //              .padding(.trailing, 22)
      //              .padding(.top, 22)
      //
      //          }
      //        }
      //
      //
      //
      //        Spacer()
      //      }
      
      VStack {
        Text("Onboarding")
          .fontWeight(.black)
          .font(.system(.largeTitle, design: .rounded))
          .padding(.top, 20)
        
        VStack(alignment: .leading) {
          Text("Must haves:")
            .font(.system(.title2, design: .rounded))
            .bold()
          
          ForEach(mustHaveFeatures, id: \.self) {
            Text($0)
              .multilineTextAlignment(.leading)
          }
          
          Text("Nice to haves:")
            .font(.system(.title2, design: .rounded))
            .bold()
          
          ForEach(niceToHaveFeatures, id: \.self) {
            Text($0)
              .multilineTextAlignment(.leading)
          }
        }
        .font(.system(.headline, design: .rounded))
        .padding(.horizontal, 20)
        
        
        Spacer()
        
        HStack {
          Spacer()
          
          Button {
            showOnboardingView.toggle()
          } label: {
            Image(systemName: "arrow.down.circle")
              .resizable()
              .frame(width: 40, height: 40)            
          }
          
          Spacer()
        }
      }
    }
    .foregroundColor(Color.white)
    
  }
  
}


struct OnboardingView_Previews: PreviewProvider {
  static let showOnboardingView = Binding.constant(false)
  
  static var previews: some View {
    OnboardingView(showOnboardingView: showOnboardingView)
  }
}
