//
//  MainView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/17/23.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var shoppingCart: ShoppingCart
  @EnvironmentObject var wishlist: WishList
  @EnvironmentObject var launchscreenModel: LaunchscreenModel

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
