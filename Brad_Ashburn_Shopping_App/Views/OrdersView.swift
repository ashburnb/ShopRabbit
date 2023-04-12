//
//  OrdersView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/10/23.
//

import SwiftUI

struct OrdersView: View {
  @EnvironmentObject var orders: OrdersViewModel

  var body: some View {

      List {
        ForEach(orders.ordersPlaced.reversed()) { order in
          Section {
            NavigationLink {
              OrderDetailView(order: order)
            } label: {
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
              } // end of VStack
            }

          }
        }
      }
      .navigationTitle("Orders Placed")

  }
}

struct Order: Identifiable, Codable {
  var id = UUID()
  let orderItems: [Item]
  let date: Date
  let totalPrice: Double
}

struct OrderDetailView: View {
  let order: Order

  var body: some View {
    Text("\(order.date)")
    Text("\(order.totalPrice)")
    Text("Number of items: \(order.orderItems.count)")
  
    List {
      ForEach(order.orderItems) { item in
        VStack(alignment: .leading, spacing: Constants.ItemDetails.vstackSpacing) {
          HStack {
            Spacer()
            AsyncImage(
              url: URL(string: item.image),
              content: { image in
                image
                  .resizable()
                  .scaledToFit()
                  .frame(
                    width: 150
                  )
              },
              placeholder: {
                ProgressView()
              }
            )
            Spacer()
          }

          Text(item.title)
            .font(.title)
          Text("$\(String(format: "%.2f", item.price))")
            .font(.title2)
          Text(item.category)
          Text(item.details)
          
          // ADD BUTTON TO PURCHASE AGAIN (Add to Cart alert)
        }
      }
    }

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

struct OrdersView_Previews: PreviewProvider {
  static var previews: some View {
    OrdersView()
      .environmentObject(OrdersViewModel())
  }
}
