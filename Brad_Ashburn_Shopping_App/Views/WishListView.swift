//
//  WishListView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/9/23.
//

import SwiftUI

struct WishListView: View {
  @EnvironmentObject var wishlist: WishList
  @EnvironmentObject var shoppingCart: ShoppingCart

  var body: some View {
    NavigationView {
      List {
        ForEach(wishlist.items, id: \.self) { item in
          HStack {
            AsyncImage(
              url: URL(string: item.image),
              content: { image in
                image.resizable()
                  .scaledToFit()
                  .frame(
                    minWidth: 50,
                    maxWidth: 50
//                    width: Constants.ShoppingCart.listImageThumbnailWidth,
//                    height: Constants.ShoppingCart.listImageThumbnailHeight
                  )
              },
              placeholder: {
                ProgressView()
              }
            )
            .padding(.trailing, 5)

            Text(item.title)

            Spacer()

            Text("$\(String(format: "%.2f", item.price))")

            Spacer()

            Button {
              shoppingCart.itemsInCart.append(item)

              let indexOfWishlistItem = wishlist.items.firstIndex(of: item)!
              wishlist.items.remove(at: indexOfWishlistItem)
            } label: {
              MoveToCartButton()
            }

          }
        }
        .onDelete(perform: deleteItems)
        .onMove(perform: move)
      }
      .navigationTitle("Wish List")
    }
  } // end of body property

  func deleteItems(at offsets: IndexSet) {
    wishlist.items.remove(atOffsets: offsets)
  }

  func move(from source: IndexSet, to destination: Int) {
    wishlist.items.move(fromOffsets: source, toOffset: destination)
  }

}

struct WishListView_Previews: PreviewProvider {
  static var previews: some View {
    WishListView()
      .environmentObject(WishList())
      .environmentObject(ShoppingCart())
  }
}
