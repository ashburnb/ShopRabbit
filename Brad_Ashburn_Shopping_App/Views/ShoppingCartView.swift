//
//  ShoppingCartView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/11/23.
//

import SwiftUI

struct ShoppingCartView: View {
  @EnvironmentObject var shoppingCart: ShoppingCart

  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(shoppingCart.itemsInCart, id: \.self) { item in
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
          .onDelete(perform: deleteItems)
        }
        .navigationTitle("Shopping Cart")

        NavigationLink {
          CheckOutView()
        } label: {
          Text("Checkout")
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .font(.title2)
            .bold()
            .cornerRadius(Constants.ShoppingCart.checkoutButtonCornerRadius)
        }
        .disabled(shoppingCart.itemsInCart.isEmpty)
        // disables button if cart is empty
      } // end of VStack
      .navigationBarTitleDisplayMode(.inline)
    } // end of NavigationView
  } // end of body property
  // needed to implement List item delete functionality
  // is passed into .onDelete as a closure
  func deleteItems(at offsets: IndexSet) {
    shoppingCart.itemsInCart.remove(atOffsets: offsets)
  }
}

struct ShoppingCartView_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCartView()
      .environmentObject(ShoppingCart())
  }
}
