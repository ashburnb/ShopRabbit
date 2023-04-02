//
//  InventoryViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import Foundation

class InventoryViewModel: ObservableObject {
  // stores entire product catalog
  @Published var inventory = [Item]() {
    didSet {
      // WEEK07 - ASSIGNMENT 4
      saveAllProductsToDocumentDirectory()
    }
  }
  
  // stores items from each product category
  @Published var jewelery: [Item] = []
  @Published var mensclothing: [Item] = []
  @Published var electronics: [Item] = []
  @Published var womensclothing: [Item] = []
  
  init() {
//    loadAllProductsFromAPI()
    loadAllProductsFromJSONFile()
  }
  
  func loadCategoryData() {
    self.jewelery = inventory.filter {$0.category == "jewelery"}
    self.electronics = inventory.filter {$0.category == "electronics"}
    self.mensclothing = inventory.filter {$0.category == "men's clothing"}
    self.womensclothing = inventory.filter {$0.category == "women's clothing"}
  }
} // end of InventoryViewModel class


extension InventoryViewModel {
  // WEEK07 - ASSIGNMENT 1 and ASSIGNMENT 3
  func loadAllProductsFromJSONFile() {
    // get url for Documents folder
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    // get url for JSON file
    let jsonDataURL = documentsDirectory.appendingPathComponent("storedata").appendingPathExtension("json")

    do {
      if try jsonDataURL.checkResourceIsReachable() {
        do {
          // convert URL contents into JSON data
          let jsonDataFromURL = try Data(contentsOf: jsonDataURL)
          
          let decoder = JSONDecoder()
          let decodedData = try decoder.decode([Item].self, from: jsonDataFromURL)
          inventory = decodedData
          return
        } catch {
          print("Failure loading JSON file from Documents Directory")
        }
      } else {
        if let jsonDataURL = Bundle.main.url(forResource: "storedata", withExtension: "json") {
          do {
            // convert URL contents into JSON data
            let jsonDataFromURL = try Data(contentsOf: jsonDataURL)
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([Item].self, from: jsonDataFromURL)

            self.inventory = decodedData
          } catch {
            print("Failure loading JSON file")
          }
        } else {
          print("Could not find JSON file in App Bundle")
        }
      }
    } catch {
      print("JSON file was unreachable in Documents Directory")
    }

  } // end of loadAllProductsFromJSONFile() method
  
  // WEEK07 - ASSIGNMENT 2
  func saveAllProductsToDocumentDirectory() {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
      let inventoryData = try encoder.encode(inventory)

      // get url for Documents folder
      let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
      // get url for JSON file
      let jsonDataURL = documentsDirectory.appendingPathComponent("storedata").appendingPathExtension("json")
      
      try inventoryData.write(to: jsonDataURL)
    } catch {
      print("Error encoding inventory to JSON file")
    }
  }

}





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
          
          DispatchQueue.main.async {
            // the class inventory property is then set to this Item array
            self.inventory = results
          }
          
        } catch {
          print("Invalid JSON")
        }
      }
    }
    
    fetchData.resume()
  } // end of loadAllProductsFromAPI() method
}
