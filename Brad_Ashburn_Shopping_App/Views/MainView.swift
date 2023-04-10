//
//  MainView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/17/23.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var shoppingCart: ShoppingCart
  @EnvironmentObject var launchscreenModel: LaunchscreenModel

  var body: some View {
    TabView {
      InventoryView()
        .tabItem {
          Label("Items", systemImage: "list.dash")
        }

      WishListView()
        .tabItem {
          Label("WishList", systemImage: "star.circle")
        }

      ShoppingCartView()
        .tabItem {
          Label("Cart", systemImage: "cart")
        }
        .badge(shoppingCart.itemsInCart.count)
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        launchscreenModel.dismiss()
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(ShoppingCart())
      .environmentObject(LaunchscreenModel())
  }
}
