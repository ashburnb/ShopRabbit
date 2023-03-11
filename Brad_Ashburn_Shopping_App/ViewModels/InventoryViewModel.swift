//
//  InventoryViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import Foundation

class InventoryViewModel: ObservableObject {
  // stores entire product catalog
  @Published var inventory: [Item]
  
  // stores items from each store category
  @Published var jewelery: [Item] = []
  @Published var mensclothing: [Item] = []
  @Published var electronics: [Item] = []
  @Published var womensclothing: [Item] = []
  
  init() {
    self.inventory = [Item]()
    loadData()
  }
  
  
  /// Makes api call to fetch the products from the fakestore api
  func loadData() {
    // creates a URL object from a string or returns out of function leaving the inventory empty
    guard let url = URL(string: "https://fakestoreapi.com/products") else {
      print("Invalid URL")
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
      if let data = data {
        do {
          let results = try JSONDecoder().decode([Item].self, from: data)
          self.inventory = results
        } catch {
          print("Invalid JSON")
        }
      }
    }
    
    task.resume()
  } // end of loadData() method
} // end of InventoryViewModel class
