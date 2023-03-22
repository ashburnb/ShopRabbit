//
//  ItemsDisplayView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/11/23.
//

import SwiftUI

struct ItemsDisplayView: View {
  let items: [Item]
  let categoryName: String
  @EnvironmentObject var shoppingCart: ShoppingCart
  
  var body: some View {
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
        } // end of HStack
      } // end of NavigationLink label
    } // end of List
    .navigationTitle("\(categoryName)")
    
  } // end of body property
}

struct ItemsDisplayView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ItemsDisplayView(items: [Item](), categoryName: "Men's clothing")
        .environmentObject(ShoppingCart())
    }
  }
}
