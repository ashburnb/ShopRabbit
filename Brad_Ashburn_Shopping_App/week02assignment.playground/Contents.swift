import UIKit

// Model data for each store item
// Must conform to Hashable protocol to be used as a key in the inventory dictionary
struct Item: Hashable {
  let id: Int
  let name: String
  let price: Double
  let description: String
  let category: String?
  let imageURL: String?
}

// Model data for the store's inventory
// contains three item category arrays and the main totalInventory dictionary
struct Inventory {
  var computers: [Item] = []
  var mobilePhones: [Item] = []
  var accessories: [Item] = []
  
  // dictionary holds all items in the store and their respective amounts in stock
  // rationale for choosing this data structure is that searching for and accessing items will be O(1) vs O(n) for an array
  var totalInventory: [Item: Int] = [:]

  
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


// create the store inventory
var storeInventory = Inventory()




// add the six items into the store inventory
// including duplicates for two of them
storeInventory.addItemToInventory(macStudio)
storeInventory.addItemToInventory(iMac)
storeInventory.addItemToInventory(macBookPro)
storeInventory.addItemToInventory(iPhone14)
storeInventory.addItemToInventory(iPhone14Pro)
storeInventory.addItemToInventory(iPhone14Pro)
storeInventory.addItemToInventory(airPodsPro)
storeInventory.addItemToInventory(airPodsPro)

storeInventory.printInventory()       // only items without any nil properties are displayed
storeInventory.printAllInventory()    // all store items are displayed

// print items found in each store category
storeInventory.printInventoryFromCategory("Computers")
storeInventory.printInventoryFromCategory("Mobile Phones")
storeInventory.printInventoryFromCategory("Accessories")

// attempts to print items from a category that does not exist in the store
print("Attempting to print from a non-existent store category")
storeInventory.printInventoryFromCategory("iPads")
print("")

// reduces amount of Mac Studio item by 1
print("Remove one Mac Studio from the inventory")
storeInventory.removeItemFromInventory(macStudio, quantity: 1)
print("")

// attempts to reduce amount of Mac Studio but cannot since amount is already zero
print("Attempting to remove another Mac Studio")
storeInventory.removeItemFromInventory(macStudio, quantity: 1)
print("")

// prints the inventory of items that have zero amounts in the inventory
storeInventory.printOutOfStockInventory()

