//
//  MainView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/17/23.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var launchscreen: LaunchscreenViewModel
  @EnvironmentObject var shoppingCart: ShoppingCartViewModel
  @EnvironmentObject var wishlist: WishListViewModel

  var body: some View {
    TabView {
      InventoryView()
        .tabItem {
          Label("Items", systemImage: "list.dash")
        }

      WishListView()
        .tabItem {
          Label("Wish List", systemImage: "star.circle")
        }
        .badge(wishlist.items.count)

      ShoppingCartView()
        .tabItem {
          Label("Cart", systemImage: "cart")
        }
        .badge(shoppingCart.itemsInCart.count)

      AccountView()
        .tabItem {
          Label("Account", systemImage: "person.crop.circle")
        }

    }
    .onAppear {
      // after 3 seconds, the dismiss method will end the launchscreen animation
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        launchscreen.dismiss()
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(LaunchscreenViewModel())
      .environmentObject(ShoppingCartViewModel())
      .environmentObject(WishListViewModel())
  }
}
