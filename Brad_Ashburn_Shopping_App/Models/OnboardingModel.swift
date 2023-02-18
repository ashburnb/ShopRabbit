//
//  OnboardingModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/17/23.
//

import Foundation

struct OnboardingModel {
  
  let mustHaveFeatures: [String] = [
    "1. Catalog items are displayed in a list",
    "2. Catalog data is fetched from an API and saved in the app",
    "3. Users can select list items and add/remove them in a shopping cart",
    "4. A checkout screen will display the items with prices and total amount",
    "5. The Checkout screen will have an option to apply a discount code",
    "6. Users can add reviews for purchased items including optional photos"
  ]
  
  let niceToHaveFeatures: [String] = [
    "1. Login system for User accounts",
    "2. Searched items can be sorted by various properties (rating, newest, etc)",
    "3. Make product pages look beautiful and easy to learn about product",
    "4. Users can create Wishlists for later",
    "5. User can create a Baby/Wedding Registry that other Users can search for",
    "6. Gamification - badges, challenges, ways to earn discount codes"
  ]
  
}

