//
//  InventoryViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import Foundation

class InventoryViewModel: ObservableObject {
  @Published var inventory: [Item]
  
  @Published var jewelery: [Item] = []
  @Published var mensclothing: [Item] = []
  @Published var electronics: [Item] = []
  @Published var womensclothing: [Item] = []
  
  init() {
    self.inventory = [Item]()
    loadData()
  }
  
  func loadData() {
    guard let url = URL(string: "https://fakestoreapi.com/products") else {
      print("Invalid URL")
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        do {
          let results = try JSONDecoder().decode([Item].self, from: data)
          self.inventory = results
        } catch {
          print("invalid")
        }
      }
    }
    
    task.resume()
  } // end of loadData() method
} // end of InventoryViewModel class
