//
//  OnboardingView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct OnboardingView: View {
  @Binding var showOnboardingView: Bool
  var onboardingData = OnboardingModel()
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    ZStack {
      Color.green
        .ignoresSafeArea()
            
      VStack {
        Text("Onboarding")
          .fontWeight(.black)
          .font(.system(.largeTitle, design: .rounded))
          .padding(.top, 20)
        
        VStack(alignment: .leading, spacing: 4.0) {
          Text("A whimiscal shopping experience.")
            .padding(.vertical, 6)
          
          Text("Must haves:")
            .font(.system(.title2, design: .rounded))
            .bold()
          
          ForEach(onboardingData.mustHaveFeatures, id: \.self) {
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
          .padding(.top, 10)
          .padding(.bottom, 22)
          
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
