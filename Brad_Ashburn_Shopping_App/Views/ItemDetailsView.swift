//
//  ItemDetailsView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/4/23.
//

import SwiftUI

struct ItemDetailsView: View {
  var item: Item
  @State var showItemAdded = false
  @State var showShoppingCart = false
  @Binding var shoppingCart: ShoppingCart
  
  var body: some View {
    VStack {
      VStack {
        Image("\(item.imageURL ?? "imagenotfound")")
          .resizable()
          .scaledToFit()
        .padding(Constants.Inventory.imagePadding)
        Text("\(item.name)")
        Text("\(item.description)")
      }
      .padding(Constants.ItemDetails.itemAndTextPadding)
      
      Button {
        shoppingCart.itemsInCart.append(item)
        showItemAdded.toggle()
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
    .sheet(isPresented: $showItemAdded) {
      VStack {
        Image("\(item.imageURL ?? "imagenotfound")")
          .resizable()
          .scaledToFit()
          .padding(Constants.Inventory.imagePadding)
        Text("\(item.name) added successfully")
        HStack {
          Button {
            showItemAdded.toggle()
          } label: {
            Text("Go back")
              .frame(
                width: Constants.ItemDetails.addToCartButtonWidth,
                height: Constants.ItemDetails.addToCartButtonHeight
              )
              .foregroundColor(.white)
              .background(.red)
              .cornerRadius(Constants.ItemDetails.addToCartButtonCornerRadius)
              .font(.title2)
              .bold()
          }
          
          Button {
            showShoppingCart.toggle()
          } label: {
            Text("Go to Cart")
              .frame(
                width: Constants.ItemDetails.addToCartButtonWidth,
                height: Constants.ItemDetails.addToCartButtonHeight
              )
              .foregroundColor(.white)
              .background(.green)
              .cornerRadius(Constants.ItemDetails.addToCartButtonCornerRadius)
              .font(.title2)
              .bold()
          }
        }
      }
      .fullScreenCover(isPresented: $showShoppingCart) {
        ShoppingCartView(shoppingCart: $shoppingCart, showShoppingCart: $showShoppingCart)
      }
    }
  } // end of body property
}


struct ItemDetailsView_Previews: PreviewProvider {
  static let sampleItem = Item(id: 808, name: "Sample Name", price: 88.88, description: "Sample item", category: nil, imageURL: nil)
  
  static var previews: some View {
    ItemDetailsView(item: sampleItem, shoppingCart: .constant(ShoppingCart()))
  }
}
