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
  @StateObject var network = NetworkMonitor()

  var body: some Scene {
    WindowGroup {
      ZStack {
        if network.isActive {
          MainView()

        } else {
          NoNetworkConnectionView()
        }

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
