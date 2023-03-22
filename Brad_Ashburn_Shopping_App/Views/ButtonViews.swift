//
//  ButtonViews.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/11/23.
//

import SwiftUI

struct CategoryTextView: View {
  let categoryName: String
  let backgroundColor: Color
  
  var body: some View {
    Text("\(categoryName)")
      .padding()
      .frame(
        width: Constants.Homescreen.categoryButtonWidth,
        height: Constants.Homescreen.categoryButtonHeight
      )
      .background(backgroundColor)
      .font(.system(.title2, design: .rounded, weight: .heavy))
      .foregroundColor(Color.white)
  }
}

struct AddToCartButton: View {
  var body: some View {
    Text("Add to cart")
      .frame(
        width: Constants.ItemDetails.addToCartButtonWidth,
        height: Constants.ItemDetails.addToCartButtonHeight
      )
      .foregroundColor(.white)
      .background(.blue)
      .cornerRadius(Constants.ItemDetails.addToCartButtonCornerRadius)
      .font(.system(.title2, design: .rounded, weight: .heavy))
      .bold()
  }
}

struct PlaceOrderButton: View {
  var body: some View {
    HStack {
      Spacer()
      Text("Place Order")
        .padding()
        .background(Color("HomescreenColor"))
        .foregroundColor(.white)
        .font(.system(.title2, design: .rounded, weight: .heavy))
        .bold()
        .cornerRadius(Constants.ShoppingCart.checkoutButtonCornerRadius)
      Spacer()
    }
  }
}


struct ButtonViews_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.gray
        .ignoresSafeArea()
      
      VStack(spacing: 30) {
        CategoryTextView(categoryName: "Jewelry", backgroundColor: .orange)
        CategoryTextView(categoryName: "Women's\nClothing", backgroundColor: .red)
        AddToCartButton()
        PlaceOrderButton()
      }
    }
  }
}

