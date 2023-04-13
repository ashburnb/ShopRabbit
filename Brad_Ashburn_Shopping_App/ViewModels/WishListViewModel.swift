//
//  WishListViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/9/23.
//

import Foundation

final class WishListViewModel: ObservableObject {
  @Published var items = [Item]() {
    didSet {
      // when an item is added or removed from the wishlist the data is saved in Documents Directory
      saveItemsInWishListToDocumentDirectory()
    }
  }

  init() {
    loadItemsInWishListFromDocumentDirectory()
  }
}

extension WishListViewModel {
  // create loadItemsFromDocumentsDirectory method
  func saveItemsInWishListToDocumentDirectory() {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
      // encode the itemsInCart array into data to store
      let cartData = try encoder.encode(items)

      // get url for Documents folder
      let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

      // get url for JSON file
      let jsonCartDataURL = documentsDirectory.appendingPathComponent("itemsInWishList").appendingPathExtension("json")

      // write the JSON data to the url
      try cartData.write(to: jsonCartDataURL)
    } catch {
      print("Error encoding cart data to JSON file")
    }
  } // end of method

}

extension WishListViewModel {
  func loadItemsInWishListFromDocumentDirectory() {
    // get url for Documents folder
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    // get url for JSON file
    let jsonCartDataURL = documentsDirectory.appendingPathComponent("itemsInWishList").appendingPathExtension("json")

    do {
      // convert URL contents into JSON data
      let jsonCartDataFromURL = try Data(contentsOf: jsonCartDataURL)

      let decoder = JSONDecoder()
      let decodedData = try decoder.decode([Item].self, from: jsonCartDataFromURL)

      items = decodedData
      return
    } catch {
      print("Initial run of app or failure loading JSON file from Documents Directory")
    }
  }
}
