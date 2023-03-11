//
//  ShoppingCart.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/4/23.
//

import Foundation

class ShoppingCart: ObservableObject {
  var itemsInCart: [Item] = []
  var discountCode: String = ""
  
  let discountTypes = [
    "springbreak": 0.10,
    "newcustomer": 0.25,
    "newyearnewyou": 0.50,
    "thanksgiving": 0.60,
    "winterwonderland": 0.75
  ]
  
  var discountPercentage: Double {
    guard let discount = discountTypes[discountCode] else {
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

