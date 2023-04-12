//
//  Order.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/12/23.
//

import Foundation

struct Order: Identifiable, Codable {
  var id = UUID()
  let orderItems: [Item]
  let date: Date
  let totalPrice: Double
}
