//
//  Inventory.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/23/23.
//

import Foundation

// data model of the store's inventory
// contains three item category arrays and the main totalInventory dictionary
struct Inventory {
  var computers: [Item] = []
  var mobilePhones: [Item] = []
  var accessories: [Item] = []
  
  // create six Items for the store
  let macStudio = Item(
                          id: 1,
                          name: "Mac Studio",
                          price: 1999,
                          description: "Powerful Mac desktop for creators and developers.",
                          category: "Computers",
//                          imageURL: "https://www.shoprabbit.com/computers/macstudio.png"
                          imageURL: "macstudio"
                      )

  let iMac = Item(
                          id: 2,
                          name: "iMac",
                          price: 1499,
                          description: "Sleek and colorful all-in-one desktop.",
                          category: "Computers",
//                          imageURL: "https://www.shoprabbit.com/computers/imac.png"
                          imageURL: "imac"
                      )

  let macBookPro = Item(
                          id: 3,
                          name: "MacBook Pro",
                          price: 2499,
                          description: "Supercharged by the M2 Pro and M2 Max chips, the all new MacBook Pro takes power and portability to a new level.",
                          category: "Computers",
                          imageURL: nil
                      )

  let iPhone14 = Item(
                          id: 4,
                          name: "iPhone 14",
                          price: 699,
                          description: "The world's most popular phone, now even faster.",
                          category: "Mobile Phones",
//                          imageURL: "https://www.shoprabbit.com/computers/iphone14.png"
                          imageURL: "iphone14"
                      )

  let iPhone14Pro = Item(
                          id: 5,
                          name: "iPhone 14 Pro",
                          price: 999,
                          description: "A magical device to capture your life's most important moments, like a pro.",
                          category: nil,
//                          imageURL: "https://www.shoprabbit.com/computers/iphone14pro.png",
                          imageURL: "iphone14pro"
                      )

  let airPodsPro = Item(
                          id: 6,
                          name: "AirPods",
                          price: 249,
                          description: "Enhanced noise cancelling, richer sound, and packed with pro features.",
                          category: "Accessories",
//                          imageURL: "https://www.shoprabbit.com/computers/airpodspro.png"
                          imageURL: "airpodspro"
                      )
  
  // dictionary holds all items in the store and their respective amounts in stock
  // rationale for choosing this data structure is that searching for and accessing items will be O(1) vs O(n) for an array
  var totalInventory: [Item: Int] = [:]
  
  init() {
    totalInventory[macStudio] = 2
    totalInventory[iMac] = 10
    totalInventory[macBookPro] = 8
    totalInventory[iPhone14] = 5
    totalInventory[iPhone14Pro] = 3
    totalInventory[airPodsPro] = 15
  }
  
  
  /// Adds an item into the inventory dictionary and increments the amount by 1, if the item is new to the inventory, the amount is set at 1 and it is added to the corresponding item category array.
  /// - Parameter item: A store item (of type Item)
  mutating func addItemToInventory(_ item: Item) {
    totalInventory[item] = (totalInventory[item] ?? 0) + 1
    
    switch item.category {
    case "Computers":
      if !computers.contains(item) {
        computers.append(item)
      }
    case "Mobile Phones":
      if !mobilePhones.contains(item) {
        mobilePhones.append(item)
      }
    case "Accessories":
      if !accessories.contains(item) {
        accessories.append(item)
      }
    default:
      return
    }
  }
  
  /// Removes an item from the inventory dictionary and decrements the corresponding quantity by the amount passed in.
  /// - Parameters:
  ///   - item: the item that is to be removed from the inventory
  ///   - quantity: how many of the item should be removed from the inventory
  mutating func removeItemFromInventory(_ item: Item, quantity: Int) {
    // this ensures that the item is in the inventory before proceeding
    guard let itemAmount = totalInventory[item] else {
      print("Item not found")
      return
    }
    
    if itemAmount == 1 {
      print("Item quantity is now 0.")
      totalInventory[item] = 0
    } else if itemAmount < quantity {
      print("Insufficient quantity to remove")
    } else {
      totalInventory[item] = itemAmount - quantity
      print("Item quantity is now \(totalInventory[item] ?? 0)")
    }
  }
  
  /// Checks if an item has nil property values for the two optional properties in the Item struct
  /// - Parameter item: a store Item
  /// - Returns: a true if the category or imageURL optional properties are nil, otherwise false
  func itemHasNilProperty(_ item: Item) -> Bool {
    item.category == nil || item.imageURL == nil
  }
  
  /// Print out the store inventory with items DO NOT have any nil props
  func printInventory() {
    print("Store Inventory (no items with nil property values):\n")
    for (item, amount) in totalInventory where !itemHasNilProperty(item) {
      print("Name: \(item.name)\nDescription: \(item.description)\nImage: \(item.imageURL ?? "")\nCategory: \(item.category ?? "")\nPrice: $\(String(format: "%.2f", item.price))\nAmount: \(amount)\n")
    }
  }
  
  /// Print out the ENTIRE store inventory INCLUDING items that have nil properties
  func printAllInventory() {
    print("Total Store Inventory (all items):\n")
    for (item, amount) in totalInventory {
      print("Name: \(item.name)\nDescription: \(item.description)\nImage: \(item.imageURL ?? "Sorry, not found")\nCategory: \(item.category ?? "Sorry, not found")\nPrice: $\(String(format: "%.2f", item.price))\nAmount: \(amount)\n")
    }
  }
  
  /// Print out all items that have zero amounts in the store inventory
  func printOutOfStockInventory() {
    print("Out of Stock Items:\n")
    for (item, amount) in totalInventory {
      if amount == 0 {
        print(item.name)
      }
    }
  }
  
  // print inventory from a certain category
  /// Print items that belong to a certain store category
  /// - Parameter category: A string representing the name of one of the three store categories
  func printInventoryFromCategory(_ category: String) {
    if category == "Computers" {
      print("Total Inventory of Computers:\n")
      for item in computers {
        print("Name: \(item.name)\nDescription: \(item.description)\nImage: \(item.imageURL ?? "Sorry, not found")\nCategory: \(item.category ?? "Sorry, not found")\nPrice: $\(String(format: "%.2f", item.price))\n")
      }
    } else if category == "Mobile Phones" {
      print("Total Inventory of Mobile Phones:\n")
      for item in mobilePhones {
        print("Name: \(item.name)\nDescription: \(item.description)\nImage: \(item.imageURL ?? "Sorry, not found")\nCategory: \(item.category ?? "Sorry, not found")\nPrice: $\(String(format: "%.2f", item.price))\n")
      }
    } else if category == "Accessories" {
      print("Total Inventory of Accessories:\n")
      for item in accessories {
        print("Name: \(item.name)\nDescription: \(item.description)\nImage: \(item.imageURL ?? "Sorry, not found")\nCategory: \(item.category ?? "Sorry, not found")\nPrice: $\(String(format: "%.2f", item.price))\n")
      }
    } else {
      print("Sorry, category not found.")
    }
  }
  
} // end of Inventory struct

