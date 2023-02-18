//
//  Constants.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import Foundation

/*
  For all hardcoded size values (widths, heights, cornerRadii) use enums
  This avoids Magic Numbers
  Constants.General.____ <- Xcode will offer code completions!
 */
enum Constants {
  
  enum Homescreen {
    public static let ButtonLineWidth: CGFloat = 2.0
    public static let Shadow: CGFloat = 1.0
    public static let ButtonPadding: CGFloat = 22.0
    public static let TitleTextSize: CGFloat = 50.0
    public static let TitleTextTopPadding: CGFloat = 20.0
    public static let BodyBottomPadding: CGFloat = 10.0
  }
  
  enum Onboarding {
    public static let TitleViewTopPadding: CGFloat = 22.0
    public static let TitleTextPadding: CGFloat = 6.0
    public static let BodyTextLineSpacing: CGFloat = 4.0
    public static let BodyTextPadding: CGFloat = 20.0

    
    public static let goBackToHomescreenButtonViewTopPadding: CGFloat = 10.0
    public static let goBackToHomescreenButtonViewBottomPadding: CGFloat = 40.0
  }
  
//  enum General {
//    public static let homescreenButtonLineWidth: CGFloat = 2.0
//    public static let homescreenShadow: CGFloat = 1.0
//    public static let homescreenButtonPadding: CGFloat = 22.0
//    public static let homescreenTitleTextSize: CGFloat = 50.0
//    public static let homescreenTitleTextTopPadding: CGFloat = 20.0
//    public static let homescreenBodyBottomPadding: CGFloat = 10.0
//
//    public static let onboardingTitleViewTopPadding: CGFloat = 22.0
//    public static let onboardingTitleTextPadding: CGFloat = 6.0
//    public static let onboardingBodyTextLineSpacing: CGFloat = 4.0
//    public static let onboardingBodyTextPadding: CGFloat = 20.0
//
//
//    public static let goBackToHomescreenButtonViewTopPadding: CGFloat = 10.0
//    public static let goBackToHomescreenButtonViewBottomPadding: CGFloat = 40.0
//  }
  
}

