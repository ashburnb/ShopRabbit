//
//  WishListView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/9/23.
//

import SwiftUI

struct WishListView: View {
  @EnvironmentObject var wishlist: WishList

  var body: some View {
    NavigationView {
      List {
        ForEach(wishlist.items, id: \.self) { item in
          HStack {
            AsyncImage(
              url: URL(string: item.image),
              content: { image in
                image.resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(
                    width: Constants.ShoppingCart.listImageThumbnailWidth,
                    height: Constants.ShoppingCart.listImageThumbnailHeight
                  )
              },
              placeholder: {
                ProgressView()
              }
            )

            Spacer()
            Text(item.title)

            Spacer()

            Text("$\(String(format: "%.2f", item.price))")
          }
        }
//        .onDelete(perform: deleteItems)
        // add move functionality
        // add text to show ranking of wish items
      }
      .navigationTitle("Wish List")
    }
  }
}

struct WishListView_Previews: PreviewProvider {
  static var previews: some View {
    WishListView()
      .environmentObject(WishList())
  }
}
