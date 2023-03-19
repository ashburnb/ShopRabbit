//
//  InventoryViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import Foundation

@MainActor class InventoryViewModel: ObservableObject {
  // stores entire product catalog
  @Published var inventory: [Item]
  
  // stores items from each product category
  @Published var jewelery: [Item] = []
  @Published var mensclothing: [Item] = []
  @Published var electronics: [Item] = []
  @Published var womensclothing: [Item] = []
  
  init() {
    self.inventory = [Item]()
    loadAllProductsFromAPI()
  }
  
  func loadCategoryData() {
    self.jewelery = inventory.filter {$0.category == "jewelery"}
    self.electronics = inventory.filter {$0.category == "electronics"}
    self.mensclothing = inventory.filter {$0.category == "men's clothing"}
    self.womensclothing = inventory.filter {$0.category == "women's clothing"}
  }
} // end of InventoryViewModel class


// adds method to fetch items
extension InventoryViewModel {
  /// Makes api call to fetch JSON products from the www.fakeapistore.com
  func loadAllProductsFromAPI() {
    // creates a URL object from a string or exits function leaving the inventory empty
    guard let url = URL(string: "https://fakestoreapi.com/products") else {
      print("Invalid URL")
      return
    }
    
    // use URLSession with url constant created above to retrieve JSON data
    // the two underscores represent response and error which are not used
    let fetchData = URLSession.shared.dataTask(with: url) { (data, _, _) in
      if let data = data {
        do {
          // fetched JSON data object is decoded into an array of items
          let results = try JSONDecoder().decode([Item].self, from: data)
          // the class inventory property is then set to this Item array
          self.inventory = results
        } catch {
          print("Invalid JSON")
        }
      }
    }
    
    fetchData.resume()
  } // end of loadAllProductsFromAPI() method
}
