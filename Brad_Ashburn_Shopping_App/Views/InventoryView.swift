//
//  InventoryView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import SwiftUI

struct InventoryView: View {
  @StateObject var store = InventoryViewModel()
  @StateObject var shoppingCart = ShoppingCart()
  
  @State var showJewelerySheet = false
  @State var showElectronicsSheet = false
  @State var showMensClothingSheet = false
  @State var showWomensClothingSheet = false
  
  var body: some View {
    VStack {
      Spacer()
      HomescreenBodyView(text: "Categories")
        .padding(.bottom, Constants.Homescreen.bodyBottomPadding)
      
      HStack(spacing: Constants.Inventory.categoryHStackSpacing) {
        VStack {
          Button {
            store.jewelery = store.inventory.filter {$0.category == "jewelery"}
            showJewelerySheet.toggle()
          } label: {
            CategoryTextView(categoryName: "Jewelry", backgroundColor: .indigo)
          }
          Button {
            store.electronics = store.inventory.filter {$0.category == "electronics"}
            showElectronicsSheet.toggle()
          } label: {
            CategoryTextView(categoryName: "Electronics", backgroundColor: .teal)
          }
        }
        
        VStack {
          Button {
            store.mensclothing = store.inventory.filter {$0.category == "men's clothing"}
            showMensClothingSheet.toggle()
          } label: {
            CategoryTextView(categoryName: "Men's\nClothing", backgroundColor: .orange)
          }
          Button {
            store.womensclothing = store.inventory.filter {$0.category == "women's clothing"}
            showWomensClothingSheet.toggle()
          } label: {
            CategoryTextView(categoryName: "Women's\nClothing", backgroundColor: .green)
          }
        }
      }
      
    } // end of VStack
    .sheet(isPresented: $showJewelerySheet) {
      ItemsDisplayView(items: store.jewelery, categoryName: "Jewelry", shoppingCart: shoppingCart)
    }
    .sheet(isPresented: $showElectronicsSheet) {
      ItemsDisplayView(items: store.electronics, categoryName: "Electronics", shoppingCart: shoppingCart)
    }
    .sheet(isPresented: $showMensClothingSheet) {
      ItemsDisplayView(items: store.mensclothing, categoryName: "Men's Clothing", shoppingCart: shoppingCart)
    }
    .sheet(isPresented: $showWomensClothingSheet) {
      ItemsDisplayView(items: store.womensclothing, categoryName: "Women's Clothing", shoppingCart: shoppingCart)
    }
  } // end of body property
} // end of CategoryView


struct InventoryView_Previews: PreviewProvider {
  static var previews: some View {
    InventoryView()
  }
}
