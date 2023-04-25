//
//  InventoryView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import SwiftUI

struct InventoryView: View {
  @EnvironmentObject var store: InventoryViewModel
  @State private var searchTerm = ""
  var searchResults: [Item] {
    searchTerm.isEmpty ? store.inventory : store.inventory.filter { $0.title.lowercased().contains(
      searchTerm.lowercased()
    )}
  }

  let columns = [
    GridItem(.adaptive(minimum: Constants.Inventory.gridColumnMinimumWidth))
  ]

  var body: some View {
    NavigationStack {
      ScrollView(.horizontal) {
        LazyHGrid(rows: columns, spacing: Constants.Inventory.gridSpacing) {
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
        .padding(Constants.Inventory.gridPadding)
        .navigationTitle("Shop Rabbit")
      }

      Text("All Items")
        .font(.title)

      List {
        ForEach(searchResults, id: \.id) { item in
          NavigationLink {
            ItemDetailView(item: item)
          } label: {
            HStack {
              AsyncImage(
                url: URL(string: item.image),
                content: { image in
                  image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                      width: Constants.ItemsDisplay.imageWidth,
                      height: Constants.ItemsDisplay.imageHeight
                    )
                },
                placeholder: {
                  ProgressView()
                }
              )

              VStack(alignment: .leading, spacing: Constants.Inventory.gridSpacing) {
                Text(item.title)
                  .font(.headline)
                Text("$\(String(format: "%.2f", item.price))")
              }
            }
          }
        }
      }
      .listStyle(PlainListStyle())
      .searchable(
        text: $searchTerm,
        placement: .navigationBarDrawer(displayMode: .always)
      )
      .textInputAutocapitalization(.never)

    } // end of NavigationStack
  } // end of body property
} // end of CategoryView

struct InventoryView_Previews: PreviewProvider {
  static var previews: some View {
    InventoryView()
      .environmentObject(InventoryViewModel())
  }
}
