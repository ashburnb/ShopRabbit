////
////  OnboardingView.swift
////  Brad_Ashburn_Shopping_App
////
////  Created by Brad Ashburn on 2/16/23.
////
//
//import SwiftUI
//
//struct OnboardingView: View {
//  @Binding var showOnboardingView: Bool
//  var onboardingData = OnboardingModel()
//
//  var body: some View {
//    ZStack {
//      Color("OnboardingColor")
//        .ignoresSafeArea()
//            
//      ScrollView {
//        VStack {
//          OnboardingTitleView(text: "About Shop Rabbit")
//            .padding(.top, Constants.Onboarding.titleViewTopPadding)
//          
//          VStack(alignment: .leading, spacing: Constants.Onboarding.bodyTextLineSpacing) {
//            Text("A whimsical shopping experience for iOS.")
//              .padding(.vertical, Constants.Onboarding.titleTextPadding)
//            
//            OnboardingBodyTitleView(text: "Essential App Features")
//            
//            ForEach(onboardingData.mustHaveFeatures, id: \.self) {
//              Text($0)
//                .multilineTextAlignment(.leading)
//            }
//            
//            Spacer()
//            
//            OnboardingBodyTitleView(text: "Nice to Have App Features")
//            
//            ForEach(onboardingData.niceToHaveFeatures, id: \.self) {
//              Text($0)
//                .multilineTextAlignment(.leading)
//            }
//          } // end of VStack
//          .font(.system(.headline, design: .rounded))
//          .padding(.horizontal, Constants.Onboarding.bodyTextPadding)
//          
//          Spacer()
//          
//          HStack {
//            Spacer()
//            GoBackToHomescreenButtonView(showOnboardingView: $showOnboardingView)
//            Spacer()
//          } // end of HStack
//          .padding(.top, Constants.Onboarding.goBackToHomescreenButtonTopPadding)
//          .padding(.bottom, Constants.Onboarding.goBackToHomescreenButtonBottomPadding)
//        }
//      }
//    } // end of ZStack
//    .foregroundColor(Color.white)
//  }
//}
//
//
//struct OnboardingView_Previews: PreviewProvider {
//  static let showOnboardingView = Binding.constant(false)
//  
//  static var previews: some View {
//    OnboardingView(showOnboardingView: showOnboardingView)
//  }
//}
