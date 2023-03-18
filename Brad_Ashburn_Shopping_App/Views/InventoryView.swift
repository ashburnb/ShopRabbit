//
//  InventoryView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import SwiftUI

struct InventoryView: View {
  @StateObject var store = InventoryViewModel()
//  @EnvironmentObject var shoppingCart: ShoppingCart
  
  let columns = [
    GridItem(.adaptive(minimum: 150))
  ]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 10) {
          NavigationLink {
            ItemsDisplayView(items: store.jewelery, categoryName: "Jewelry")
          } label: {
            CategoryTextView(categoryName: "Jewelry", backgroundColor: .green)
          }
          NavigationLink {
            ItemsDisplayView(items: store.electronics, categoryName: "Electronics")
          } label: {
            CategoryTextView(categoryName: "Electronics", backgroundColor: .orange)
          }
          NavigationLink {
            ItemsDisplayView(items: store.mensclothing, categoryName: "Men's Clothing")
          } label: {
            CategoryTextView(categoryName: "Men's Clothing", backgroundColor: .blue)
          }
          NavigationLink {
            ItemsDisplayView(items: store.womensclothing, categoryName: "Women's Clothing")
          } label: {
            CategoryTextView(categoryName: "Women's Clothing", backgroundColor: .pink)
          }
        }
        .padding(20)
      } // end of ScrollView
      .navigationTitle("Store Categories")
      .onAppear {
        store.loadCategoryData()
      }
    } // end of NavigationStack
  } // end of body property
} // end of CategoryView


struct InventoryView_Previews: PreviewProvider {
  static var previews: some View {
    InventoryView()
  }
}
