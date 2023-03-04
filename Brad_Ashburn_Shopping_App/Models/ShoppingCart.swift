//
//  ShoppingCart.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/4/23.
//

import Foundation

// data model for the user's shopping cart
// totalAmount and totalAmountAfterDiscount were chosen to be computed properties since they are not computationally intensive
struct ShoppingCart {
  var itemsInCart: [Item] = []
  var discountCode: String? = nil
  let discountTypes = [
    "tenOff": 0.10,
    "twentyFiveOff": 0.25,
    "halfOff": 0.50
  ]
  
  var discountPercentage: Double {
    guard let discount = discountTypes[discountCode ?? ""] else {
      return 0
    }
    return discount
  }
  
  var totalAmount: Double {
    return itemsInCart.reduce(0) { $0 + $1.price }
  }
  
  var totalAmountAfterDiscount: Double {
    return totalAmount - (totalAmount * discountPercentage)
  }
}


