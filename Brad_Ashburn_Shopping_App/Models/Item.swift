//
//  ItemModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/11/23.

import Foundation

// data model for each product from www.fakestoreapi.com
struct Item: Codable, Hashable, Identifiable {
  let id: Int
  let title: String
  let price: Double
  let category: String
  let details: String
  let image: String

  // this enum is needed to decode the JSON description key into the differently named details key
  enum CodingKeys: String, CodingKey {
    case id, title, price, category, image
    case details = "description"
  }
}
