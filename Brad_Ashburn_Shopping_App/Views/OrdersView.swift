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

struct OrderDetailView: View {
  @EnvironmentObject var shoppingCart: ShoppingCartViewModel
  let order: Order

  var body: some View {
    VStack(alignment: .leading) {
      Text("Ordered on \(order.date.formatted(date: .abbreviated, time: .omitted))")
      Text("$\(String(format: "%.2f", order.totalPrice))")
      Text("Number of items: \(order.orderItems.count)")
    }

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

          Button {
            shoppingCart.itemsInCart.append(item)
          } label: {
            AddToCartButton()
          }

        }
      }
    }
    .navigationTitle("Order Details")

  }
}

struct OrdersView_Previews: PreviewProvider {
  static var previews: some View {
    OrdersView()
      .environmentObject(ShoppingCartViewModel())
      .environmentObject(OrdersViewModel())
  }
}
