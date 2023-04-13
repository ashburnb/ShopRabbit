//
//  ShopRabbit.swift
//  Shop Rabbit - Kodeco Bootcamp Capstone Project
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

@main
struct ShopRabbit: App {
  @StateObject var launchscreen = LaunchscreenViewModel()
  @StateObject var inventory = InventoryViewModel()
  @StateObject var shoppingCart = ShoppingCartViewModel()
  @StateObject var wishlist = WishListViewModel()
  @StateObject var orders = OrdersViewModel()

  var body: some Scene {
    WindowGroup {
      ZStack {
        MainView()
        if launchscreen.state != .completed {
          LaunchscreenView()
        }
      }
      .environmentObject(launchscreen)
      .environmentObject(inventory)
      .environmentObject(shoppingCart)
      .environmentObject(wishlist)
      .environmentObject(orders)
    }
  }

}
