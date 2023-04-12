//
//  OrdersViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/12/23.
//

import Foundation

final class OrdersViewModel: ObservableObject {
  @Published var ordersPlaced = [Order]() {
    didSet {
      saveOrdersToDocumentDirectory()
    }
  }

  init() {
    loadOrdersFromDocumentDirectory()
  }
}

extension OrdersViewModel {
  func saveOrdersToDocumentDirectory() {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
      // encode the itemsInCart array into data to store
      let cartData = try encoder.encode(ordersPlaced)

      // get url for Documents folder
      let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

      // get url for JSON file
      let jsonCartDataURL = documentsDirectory.appendingPathComponent("orders").appendingPathExtension("json")

      // write the JSON data to the url
      try cartData.write(to: jsonCartDataURL)
    } catch {
      print("Error encoding cart data to JSON file")
    }
  }
}

extension OrdersViewModel {
  func loadOrdersFromDocumentDirectory() {
    // get url for Documents folder
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    // get url for JSON file
    let jsonCartDataURL = documentsDirectory.appendingPathComponent("orders").appendingPathExtension("json")

    do {
      // convert URL contents into JSON data
      let jsonCartDataFromURL = try Data(contentsOf: jsonCartDataURL)

      let decoder = JSONDecoder()
      let decodedData = try decoder.decode([Order].self, from: jsonCartDataFromURL)

      ordersPlaced = decodedData
      return
    } catch {
      print("Initial run of app or failure loading JSON file from Documents Directory")
    }
  }
}
