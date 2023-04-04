//
//  ShoppingCart.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/4/23.
//

import Foundation

class ShoppingCart: ObservableObject {
  @Published var discountPercentage: Double = 0
  @Published var itemsInCart = [Item]() {
    // WEEK07 - ASSIGNMENT 4
    // when an item is added or removed from the cart, this data is saved in Documents Directory
    didSet {
      saveItemsInShoppingCartToDocumentDirectory()
    }
  }
  
  let discountTypes = [
    "springbreak": 0.10,
    "newcustomer": 0.25,
    "newyearnewyou": 0.50,
    "thanksgiving": 0.60,
    "winterwonderland": 0.75
  ]
  
  init() {
    // WEEK07 - ASSIGNMENT 4
    loadItemsInShoppingCartFromDocumentDirectory()
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


extension ShoppingCart {
  // WEEK07 - ASSIGNMENT 4 + Above and Beyond
  func saveItemsInShoppingCartToDocumentDirectory() {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
      // encode the itemsInCart array into data to store
      let cartData = try encoder.encode(itemsInCart)

      // get url for Documents folder
      let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
      
      // get url for JSON file
      let jsonCartDataURL = documentsDirectory.appendingPathComponent("itemsInCart").appendingPathExtension("json")
      
      // write the JSON data to the url
      try cartData.write(to: jsonCartDataURL)
    } catch {
      print("Error encoding cart data to JSON file")
    }
  }
  
  // WEEK07 - ASSIGNMENT 4
  func loadItemsInShoppingCartFromDocumentDirectory() {
    // get url for Documents folder
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    // get url for JSON file
    let jsonCartDataURL = documentsDirectory.appendingPathComponent("itemsInCart").appendingPathExtension("json")
    
    do {
      // convert URL contents into JSON data
      let jsonCartDataFromURL = try Data(contentsOf: jsonCartDataURL)
      
      let decoder = JSONDecoder()
      let decodedData = try decoder.decode([Item].self, from: jsonCartDataFromURL)
      
      itemsInCart = decodedData
      return
    } catch {
      print("Initial run of app or failure loading JSON file from Documents Directory")
    }
  }
  
} // end of extension


