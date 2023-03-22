//
//  Brad_Ashburn_Shopping_AppApp.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

@main
struct Brad_Ashburn_Shopping_App: App {
  @StateObject var shoppingCart = ShoppingCart()
  
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(shoppingCart)
    }
  }
}
