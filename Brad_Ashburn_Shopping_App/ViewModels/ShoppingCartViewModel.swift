//
//  ShoppingCart.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/4/23.
//

import Foundation

class ShoppingCartViewModel: ObservableObject {
  @Published var discountPercentage: Double? = 0
  @Published var itemsInCart = [Item]() {
    // when an item is added or removed from the cart, this data is saved in Documents Directory
    didSet {
      saveItemsInShoppingCartToDocumentDirectory()
    }
  }
  @Published var discountTypes = [String: Double]()

  init() {
    loadItemsInShoppingCartFromDocumentDirectory()
  }

  // when carrots points are successfully redeemed for a discount, this method will create a random
  // six character discount code
  func createDiscountCode() -> String {
    let alphanumerics = Array("abcdefghijklmnopqrstuvwxyz1234567890")
    var discountCode = ""
    for _ in 1...6 {
      discountCode += String(alphanumerics.randomElement()!)
    }
    return discountCode
  }

  // the discount code generated in the method above will be saved into the @Published dictionary
  func saveDiscountCode(_ discountCode: String, percentOff: Double) {
    discountTypes[discountCode] = percentOff
  }

  // after the apply discount button in CheckOutView is pressed, this method removes the code from further use
  func removeDiscountCode(_ discountCode: String) {
    discountTypes.removeValue(forKey: discountCode)
  }

  func calculateDiscountPercentage(using discountCode: String) -> Double? {
    return discountTypes[discountCode]
  }

}

extension ShoppingCartViewModel {
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
