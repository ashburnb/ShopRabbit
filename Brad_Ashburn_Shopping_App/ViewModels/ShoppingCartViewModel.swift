//
//  ShoppingCart.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/4/23.
//

import Foundation

class ShoppingCart: ObservableObject {
  @Published var itemsInCart: [Item] = []
  @Published var discountPercentage: Double = 0
  
  let discountTypes = [
    "springbreak": 0.10,
    "newcustomer": 0.25,
    "newyearnewyou": 0.50,
    "thanksgiving": 0.60,
    "winterwonderland": 0.75
  ]
  
  init() {
    self.itemsInCart = [Item]()
  }
}


extension ShoppingCart {
  func calculateDiscountPercentage(discountCode: String) {
    guard let discount = discountTypes[discountCode] else {
      return
    }
    discountPercentage = discount
  }
  
}
