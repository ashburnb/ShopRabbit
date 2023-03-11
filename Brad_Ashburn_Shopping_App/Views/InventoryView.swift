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
        .padding(.bottom, 10)
      
      HStack(spacing: 10) {
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


struct ItemsDisplayView: View {
  let items: [Item]
  let categoryName: String
  @ObservedObject var shoppingCart: ShoppingCart
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    NavigationView {
      List(items, id: \.id) { item in
        NavigationLink {
          ItemDetailView(item: item, shoppingCart: shoppingCart)
        } label: {
          HStack {
            AsyncImage(
              url: URL(string: item.image),
              content: { image in
                image.resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 100, height: 100)
              },
              placeholder: {
                ProgressView()
              }
            )
            
            VStack(alignment: .leading, spacing: 10) {
              Text(item.title)
                .font(.headline)
              Text("$\(String(format: "%.2f", item.price))")
            }
          }
        }
      }
      .navigationTitle("\(categoryName)")
      .toolbar {
        Button {
          dismiss()
        } label: {
          Text("Categories")
        }

      }
    } // end of NavigationView
  }
}


struct InventoryView_Previews: PreviewProvider {
  static var previews: some View {
    InventoryView()
  }
}
