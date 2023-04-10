//
//  ItemDetailView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import SwiftUI

struct ItemDetailView: View {
  let item: Item
  @EnvironmentObject var shoppingCart: ShoppingCart
  @State var showItemAdded = false

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: Constants.ItemDetails.vstackSpacing) {
        HStack {
          Spacer()
          AsyncImage(
            url: URL(string: item.image),
            content: { image in
              image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                  width: Constants.ItemDetails.imageWidth,
                  height: Constants.ItemDetails.imageHeight
                )
            },
            placeholder: {
              ProgressView()
            }
          )
          Spacer()
        }

        Text(item.title)
          .font(.title)
        Text("$\(String(format: "%.2f", item.price))")
          .font(.title2)
        Text(item.category)
        Text(item.details)

        HStack {
          Button {
            // add to wishlist
            // show an alert that item was added
          } label: {
            AddToWishListButton()
          }
          
          Spacer()

          Button {
            shoppingCart.itemsInCart.append(item)
            showItemAdded.toggle()
          } label: {
            AddToCartButton()
          }
        }
        .alert("Added to Cart", isPresented: $showItemAdded) {
          // could add more button functionality here
          // or this could become a custom alert view like in Week 1 Bullseye Assignment
        } message: {
          Text("\(item.title)")
        }
      } // end of VStack
      .padding(Constants.ItemDetails.vstackPadding)
    }
  }
}

struct ItemDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ItemDetailView(item: Item(
      id: 808,
      title: "AirPods Pro",
      price: 249.00,
      category: "Electronics",
      details: "Enhanced noise cancelling, richer sound, and packed with pro features.",
      image: "airpodspro")
    )
      .environmentObject(ShoppingCart())
  }
}
