//
//  ItemModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/11/23.
//

import Foundation

// data model for each product from www.fakestoreapi.com
struct Item: Codable, Hashable {
  let id: Int
  let title: String
  let price: Double
  let category: String
  //let description: String
  let details: String
  let image: String
  
  // WEEK07 - ABOVE AND BEYOND
  enum CodingKeys: String, CodingKey {
    case id, title, price, category, image
    case details = "description"
  }
}
