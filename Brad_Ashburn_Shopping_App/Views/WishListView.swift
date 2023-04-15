//
//  WishListView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/9/23.
//

import SwiftUI

struct WishListView: View {
  @EnvironmentObject var wishlist: WishListViewModel
  @EnvironmentObject var shoppingCart: ShoppingCartViewModel

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
                    minWidth: Constants.Wishlist.wishlistImageThumbnailWidth,
                    maxWidth: Constants.Wishlist.wishlistImageThumbnailHeight
                  )
              },
              placeholder: {
                ProgressView()
              }
            )
            .padding(.trailing, Constants.Wishlist.wishlistPadding)

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

  // allows "press and hold" to move the items around on screen
  func move(from source: IndexSet, to destination: Int) {
    wishlist.items.move(fromOffsets: source, toOffset: destination)
  }

}

struct WishListView_Previews: PreviewProvider {
  static var previews: some View {
    WishListView()
      .environmentObject(WishListViewModel())
      .environmentObject(ShoppingCartViewModel())
  }
}
