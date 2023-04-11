//
//  AccountView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/10/23.
//

import SwiftUI

struct AccountView: View {
  @EnvironmentObject var orders: OrdersViewModel

  var body: some View {
    NavigationView {
      List {
        ForEach(orders.ordersPlaced.reversed()) { order in
          Section {
            VStack(alignment: .leading) {
              Text("\(order.date.formatted(date: .abbreviated, time: .shortened))")
              Text("$\(String(format: "%.2f", order.totalPrice))")
              HStack {
                ForEach(order.orderItems) { item in
                  AsyncImage(url: URL(string: item.image)) { image in
                    image
                      .resizable()
                      .scaledToFit()
                      .frame(maxHeight: 50)
                  } placeholder: {
                    ProgressView()
                  }

                }
              }
            }
          }
        }
      }
      .navigationTitle("Orders Placed")
    }
  }
}

struct Order: Identifiable, Codable {
  var id = UUID()
  let orderItems: [Item]
  let date: Date
  let totalPrice: Double
}

struct OrderDetailView: View {
  var body: some View {
    Text("List of each item in the order")
    // have button to add the item to the cart to order again
  }
}

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

struct AccountView_Previews: PreviewProvider {
  let order1 = Order(orderItems: [Item(id: 1,
                                       title: "iPhone",
                                       price: 500,
                                       category: "Electronics",
                                       details: "The world's best phone",
                                       image: "")], date: Date.now, totalPrice: 100)
  let order2 = Order(orderItems: [Item(id: 2,
                                       title: "Mac Studio",
                                       price: 2000,
                                       category: "Electronics",
                                       details: "The world's most powerful Mac",
                                       image: "")], date: Date.now, totalPrice: 200)
  static var previews: some View {
    AccountView()
      .environmentObject(OrdersViewModel())
  }
}
