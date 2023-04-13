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
      .frame(
        width: 130,
        height: Constants.Homescreen.categoryButtonHeight
      )
      .background(backgroundColor)
      .font(.system(.title2, design: .rounded, weight: .heavy))
      .foregroundColor(Color.white)
      .cornerRadius(20)
  }
}

struct AddToCartButton: View {
  var body: some View {
    VStack {
      Image(systemName: "cart")
        .font(.system(size: 50))

      Text("Add to cart")
        .font(.system(.title2, design: .rounded, weight: .heavy))
        .bold()
    }
    .padding()
    .frame(
      width: 160,
      height: 100
    )
    .foregroundColor(.white)
    .background(Color("HomescreenColor"))
    .cornerRadius(Constants.ItemDetails.addToCartButtonCornerRadius)
  }
}

struct MoveToCartButton: View {
  var body: some View {
    Image(systemName: "cart")
      .font(.system(size: 20))
      .padding(5)
      .foregroundColor(.white)
      .background(Color("HomescreenColor"))
      .cornerRadius(8)
  }
}

struct MoveToWishlistButton: View {
  var body: some View {
    Image(systemName: "star.circle")
      .font(.system(size: 20))
      .padding(5)
      .foregroundColor(.white)
      .background(Color("OnboardingColor"))
      .cornerRadius(8)
  }
}

struct AddToWishListButton: View {
  var body: some View {
    VStack {
      Image(systemName: "star.circle")
        .font(.system(size: 50))

      Text("WishList")
        .font(.system(.title2, design: .rounded, weight: .heavy))
        .bold()
    }
    .padding()
    .frame(
      // Constants.ItemDetails.addToCartButtonWidth
      width: 160,
      height: 100
    )
    .foregroundColor(.white)
    .background(Color("OnboardingColor"))
    .cornerRadius(Constants.ItemDetails.addToCartButtonCornerRadius)
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
        MoveToCartButton()
        MoveToWishlistButton()
        AddToWishListButton()
        PlaceOrderButton()
      }
    }
  }
}
