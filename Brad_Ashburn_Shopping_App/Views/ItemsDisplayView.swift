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
    //    NavigationView {
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
          
          VStack(alignment: .leading, spacing: 10) {
            Text(item.title)
              .font(.headline)
            Text("$\(String(format: "%.2f", item.price))")
          }
        }
      }
    }
    .navigationTitle("\(categoryName)")
  }
}

struct ItemsDisplayView_Previews: PreviewProvider {
  static var previews: some View {
    ItemsDisplayView(items: [Item](), categoryName: "Men's clothing")
      .environmentObject(ShoppingCart())
  }
}
