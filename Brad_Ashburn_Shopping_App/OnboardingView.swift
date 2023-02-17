//
//  OnboardingView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct OnboardingView: View {
  @Binding var showOnboardingView: Bool
  let features: [String] = [
    "1. Catalog items are displayed in a list",
    "2. Catalog data is fetched from an API and saved in the app",
    "3. Users can select list items and add them to a shopping cart",
    "4. A checkout screen will display the items with their associated prices and total shopping car amount",
    "5. The Checkout screen will have an option to apply a discount code",
    "6. Users can add reviews for purchased items including optional photos taken using their phone camera"
  
  
  ]

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
            Text("Back")
          }
        }
        .padding()
        
        Spacer()
      }
      
      VStack {
        Text("Onboarding")
          .font(.largeTitle)
        
        VStack(alignment: .leading) {
          Text("Must haves:")
            .font(.title2)
          ForEach(features, id: \.self) {
            Text($0)
              .font(.headline)
              .multilineTextAlignment(.leading)
              
          }
        }
        .padding()
        
        
        
        Spacer()
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
