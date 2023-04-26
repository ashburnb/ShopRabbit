//
//  InventoryViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import Foundation

@MainActor class InventoryViewModel: ObservableObject {
  // stores entire product catalog
  @Published var inventory = [Item]() {
    didSet {
      saveAllProductsToDocumentDirectory()
    }
  }

  // stores items from each product category
  @Published var jewelery = [Item]()
  @Published var mensclothing = [Item]()
  @Published var electronics = [Item]()
  @Published var womensclothing = [Item]()

  init() {
    Task {
      await loadAllProductsFromAPI()
      loadCategoryData()
    }
//    loadAllProductsFromJSONFile()

  }

  func loadCategoryData() {
    self.jewelery = inventory.filter {$0.category == "jewelery"}
    self.electronics = inventory.filter {$0.category == "electronics"}
    self.mensclothing = inventory.filter {$0.category == "men's clothing"}
    self.womensclothing = inventory.filter {$0.category == "women's clothing"}
  }
} // end of InventoryViewModel class

extension InventoryViewModel {
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
        } catch {
          print("Failure loading JSON file from Documents Directory")
        }
      }
    } catch {
      // if the file is not reachable in the Documents Directory, then load the JSON file in the App Bundle resources
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

  } // end of loadAllProductsFromJSONFile() method

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

} // end of extension

// WEEK 09 - PART 1 and 2
extension InventoryViewModel {
  /// Makes api call to fetch JSON products from the www.fakeapistore.com
  func loadAllProductsFromAPI() async {
    // creates a URL object from a string or exits function leaving the inventory empty
    guard let url = URL(string: "https://fakestoreapi.com/products") else {
      print("Invalid URL")
      return
    }

    let configuration = URLSessionConfiguration.default
    configuration.waitsForConnectivity = true               // wait for connectivity or fail immediately
    configuration.timeoutIntervalForRequest = 10           // unit is seconds
    configuration.allowsCellularAccess = true               // set to false to prevent cellular network access
    configuration.allowsExpensiveNetworkAccess = true     // set to false to prevent expensive network access
    configuration.allowsConstrainedNetworkAccess = true  // set to false to prevent network access in Low Data Mode

    let session = URLSession(configuration: configuration)

    do {
      let (data, response) = try await session.data(from: url)
      guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        print("Server Error occurred")
        return
      }
      print("The data received was \(data).")
      self.inventory = try JSONDecoder().decode([Item].self, from: data)
    } catch {
      print("Error from API request")
    }

    // BELOW IS THE OLDER METHOD I ORIGINALLY CHOSE BEFORE LEARNING ASYNC/AWAIT
    // use URLSession with url constant created above to retrieve JSON data
    // the two underscores represent response and error which are not used
//    let fetchData = URLSession.shared.dataTask(with: url) { (data, _, _) in
//      if let data = data {
//        do {
//          // fetched JSON data object is decoded into an array of items
//          let results = try JSONDecoder().decode([Item].self, from: data)
//
//          DispatchQueue.main.async {
//            // the class inventory property is then set to this Item array
//            self.inventory = results
//          }
//
//        } catch {
//          print("Invalid JSON")
//        }
//      }
//    }

//    fetchData.resume()
  } // end of loadAllProductsFromAPI() method
}
