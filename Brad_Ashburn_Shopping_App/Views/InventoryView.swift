//
//  InventoryView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import SwiftUI

struct InventoryView: View {
  @StateObject var store = InventoryViewModel()
  @State var showJewelerySheet = false
  @State var showElectronicsSheet = false
  @State var showMensClothingSheet = false
  @State var showWomensClothingSheet = false
  
  var body: some View {
      VStack {
        Spacer()
        HomescreenBodyView(text: "Categories")
        
        HStack(spacing: 10) {
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
          
          Button {
            store.mensclothing = store.inventory.filter {$0.category == "men's clothing"}
            showMensClothingSheet.toggle()
          } label: {
            CategoryTextView(categoryName: "Men's Clothing", backgroundColor: .orange)
          }
          
          Button {
            store.womensclothing = store.inventory.filter {$0.category == "women's clothing"}
            showWomensClothingSheet.toggle()
          } label: {
            CategoryTextView(categoryName: "Women's Clothing", backgroundColor: .green)
          }
        }
      
      } // end of VStack
      .sheet(isPresented: $showJewelerySheet) {
        ItemsDisplayView(items: store.jewelery, categoryName: "Jewelry")
      }
      .sheet(isPresented: $showElectronicsSheet) {
        ItemsDisplayView(items: store.electronics, categoryName: "Electronics")
      }
      .sheet(isPresented: $showMensClothingSheet) {
        ItemsDisplayView(items: store.mensclothing, categoryName: "Men's Clothing")
      }
      .sheet(isPresented: $showWomensClothingSheet) {
        ItemsDisplayView(items: store.womensclothing, categoryName: "Women's Clothing")
    }
  } // end of body property
} // end of CategoryView

struct CategoryTextView: View {
  let categoryName: String
  let backgroundColor: Color
  
  var body: some View {
    Text("\(categoryName)")
      .frame(width: 80, height: 80)
      .background(backgroundColor)
      .foregroundColor(.white)
      .fontWeight(.heavy)
      .font(.system(.caption, design: .rounded))
      .cornerRadius(20)
  }
}

struct ItemsDisplayView: View {
  let items: [Item]
  let categoryName: String
  
  var body: some View {
    NavigationView {
      List(items, id: \.id) { item in
        NavigationLink {
          ItemDetailView(item: item)
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
    } // end of NavigationView
  }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}
