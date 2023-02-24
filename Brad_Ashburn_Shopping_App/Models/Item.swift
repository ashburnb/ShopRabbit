//
//  Item.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/23/23.
//

import Foundation

// Model data for each store item
// Must conform to Hashable protocol to be used as a key in the inventory dictionary
struct Item: Hashable, Comparable {
  static func < (lhs: Item, rhs: Item) -> Bool {
    lhs.id < rhs.id
  }
  
  let id: Int
  let name: String
  let price: Double
  let description: String
  let category: String?
  let imageURL: String?
}
