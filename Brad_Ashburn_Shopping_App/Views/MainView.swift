//
//  MainView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/17/23.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var shoppingCart: ShoppingCart
  
  var body: some View {
    TabView {
      HomescreenView()
        .tabItem {
          Label("Home", systemImage: "house")
        }
      
      InventoryView()
        .tabItem {
          Label("Items", systemImage: "list.dash")
        }
      
      ShoppingCartView()
        .tabItem {
          Label("Cart", systemImage: "cart")
        }
        .badge(shoppingCart.itemsInCart.count)
        // instead of using hard coded value as instructions said, I used the actual amount of items in the cart. Note that badge doesn't show up items == 0
    }
  }
}


struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(ShoppingCart())
  }
}
