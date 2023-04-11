//
//  Brad_Ashburn_Shopping_AppApp.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

@main
struct BradAshburnShoppingApp: App {
  @StateObject var shoppingCart = ShoppingCart()
  @StateObject var wishlist = WishList()
  @StateObject var launchscreenModel = LaunchscreenModel()
  @StateObject var store = InventoryViewModel()
  @StateObject var orders = OrdersViewModel()

  var body: some Scene {
    WindowGroup {
      ZStack {
        MainView()
        if launchscreenModel.state != .completed {
          LaunchscreenView()
        }
      }
      .environmentObject(shoppingCart)
      .environmentObject(launchscreenModel)
      .environmentObject(store)
      .environmentObject(wishlist)
      .environmentObject(orders)
    }
  }
}
