//
//  ItemDetailView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import SwiftUI

struct ItemDetailView: View {
  let item: Item
  @State var showCart: Bool = false
  @Environment(\.dismiss) var dismiss
  @ObservedObject var shoppingCart: ShoppingCart
  
  
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
        Text(item.description)
        
        HStack {
          Spacer()
          Button {
            shoppingCart.itemsInCart.append(item)
            shoppingCart.calculateTotalAmount()
            shoppingCart.calculateTotalAmountAfterDiscount()
            showCart.toggle()
          } label: {
            Text("Add to cart")
              .frame(
                width: Constants.ItemDetails.addToCartButtonWidth,
                height: Constants.ItemDetails.addToCartButtonHeight
              )
              .foregroundColor(.white)
              .background(.blue)
              .cornerRadius(Constants.ItemDetails.addToCartButtonCornerRadius)
              .font(.title2)
              .bold()
          }
        }
      } // end of VStack
      .padding(Constants.ItemDetails.vstackPadding)
      .fullScreenCover(isPresented: $showCart) {
        ShoppingCartView(shoppingCart: shoppingCart, showShoppingCart: $showCart)
      }
    }
  }
}

struct ItemDetailView_Previews: PreviewProvider {
  static var previews: some View {
    InventoryView()
  }
}
