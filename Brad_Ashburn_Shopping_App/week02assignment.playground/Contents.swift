import UIKit

struct Item: Hashable {
  let id: Int
  let name: String
  var price: Double
  let description: String
  let category: String?
  let imageURL: String?
}

struct Inventory {
  var computers: [Item] = []
  var mobilePhones: [Item] = []
  var accessories: [Item] = []
  
  // dictionary holds all items in the store and their respective amounts in stock
  // rationale is that searching for and accessing items will be O(1) vs O(n) for an array
  var totalInventory: [Item: Int] = [:]
  

  /// <#Description#>
  /// - Parameter item: <#item description#>
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
  
  
  /// <#Description#>
  /// - Parameters:
  ///   - item: <#item description#>
  ///   - quantity: <#quantity description#>
  mutating func removeItemFromInventory(_ item: Item, quantity: Int) {
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
  
  
  /// <#Description#>
  /// - Parameter item: <#item description#>
  /// - Returns: <#description#>
  func itemHasNilProperty(_ item: Item) -> Bool {
    item.category == nil || item.imageURL == nil
  }
  
  // print out collection whose items do not have any nil props
  /// <#Description#>
  func printInventory() {
    print("Store Inventory:\n")
    for (item, amount) in totalInventory where !itemHasNilProperty(item) {
      print("Name: \(item.name)\nDescription: \(item.description)\nImage: \(item.imageURL ?? "")\nCategory: \(item.category ?? "")\nPrice: $\(String(format: "%.2f", item.price))\nAmount: \(amount)\n")
    }
  }
  
  // print out all items in inventory even if some properties are nil
  /// <#Description#>
  func printAllInventory() {
    print("Total Store Inventory:\n")
    for (item, amount) in totalInventory {
      print("Name: \(item.name)\nDescription: \(item.description)\nImage: \(item.imageURL ?? "Sorry, not found")\nCategory: \(item.category ?? "Sorry, not found")\nPrice: $\(String(format: "%.2f", item.price))\nAmount: \(amount)\n")
    }
  }

  // print out items that are out of stock
  /// <#Description#>
  func printOutOfStockInventory() {
    for (item, amount) in totalInventory {
      if amount == 0 {
        print(item)
      }
    }
  }
  
  // print inventory from a certain category
  /// <#Description#>
  /// - Parameter category: <#category description#>
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


var storeInventory = Inventory()

let macStudio = Item(
                        id: 1,
                        name: "Mac Studio",
                        price: 1999,
                        description: "Powerful Mac desktop for creators and developers.",
                        category: "Computers",
                        imageURL: "https://www.shoprabbit.com/computers/macstudio.png"
                    )

let iMac = Item(
                        id: 2,
                        name: "iMac",
                        price: 1499,
                        description: "Sleek and colorful all-in-one desktop.",
                        category: "Computers",
                        imageURL: "https://www.shoprabbit.com/computers/imac.png"
                    )

let macBookPro = Item(
                        id: 3,
                        name: "MacBook Pro",
                        price: 2499,
                        description: "Supercharged by the M2 Pro and M2 Max chips, the MacBook Pro take power and portability to a new level.",
                        category: "Computers",
                        imageURL: nil
                    )

let iPhone14 = Item(
                        id: 4,
                        name: "iPhone 14",
                        price: 699,
                        description: "The world's most popular phone, now even faster.",
                        category: "Mobile Phones",
                        imageURL: "https://www.shoprabbit.com/computers/iphone14.png"
                    )

let iPhone14Pro = Item(
                        id: 5,
                        name: "iPhone 14 Pro",
                        price: 999,
                        description: "A magical device to capture your life's most important moments, like a pro.",
                        category: "Mobile Phones",
                        imageURL: nil
                    )

let airPodsPro = Item(
                        id: 6,
                        name: "AirPods",
                        price: 249,
                        description: "Enhanced noise cancelling, richer sound, and packed with pro features.",
                        category: "Accessories",
                        imageURL: "https://www.shoprabbit.com/computers/airpodspro.png"
                    )


// adding items into the store inventory
storeInventory.addItemToInventory(macStudio)
storeInventory.addItemToInventory(iMac)
storeInventory.addItemToInventory(macBookPro)
storeInventory.addItemToInventory(iPhone14)
storeInventory.addItemToInventory(iPhone14Pro)
storeInventory.addItemToInventory(iPhone14Pro)
storeInventory.addItemToInventory(airPodsPro)
storeInventory.addItemToInventory(airPodsPro)

//storeInventory.printInventory()       // only items without any nil properties are displayed
//storeInventory.printAllInventory()    // all store items are displayed

// prints items found in categories
//storeInventory.printInventoryFromCategory("Computers")
//storeInventory.printInventoryFromCategory("Mobile Phones")
//storeInventory.printInventoryFromCategory("Accessories")
//storeInventory.printInventoryFromCategory("iPads")



storeInventory.removeItemFromInventory(macStudio, quantity: 1)
storeInventory.removeItemFromInventory(macStudio, quantity: 1)

storeInventory.printAllInventory()
storeInventory.removeItemFromInventory(airPodsPro, quantity: 10)




//In Xcode App:
//  Make all revisions from Vidhur's comments, push to main
//  Create new branch of revised main
//  Add new file called ItemModel
//
//A&B
//create a new screen that displays the inventory data nicely
//create items for each inventory property (computers, mobile phones, and accessories)

