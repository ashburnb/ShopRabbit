//
//  CheckOutView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/18/23.
//

import SwiftUI

struct CheckOutView: View {
  @EnvironmentObject var shoppingCart: ShoppingCartViewModel
  @EnvironmentObject var orders: OrdersViewModel
  @EnvironmentObject var wishlist: WishListViewModel
  private let paymentTypes = ["Credit Card", "Apple Pay", "Venmo", "PayPal"]
  @State private var paymentType = "Credit Card"
  @State private var displayCreditCardEntry = false
  @State private var creditCardNumber = ""
  @State private var hasDiscountCode = false
  @State private var discountField: String = ""
  @State private var showOrderConfirmed = false

  var totalPrice: Double {
    return shoppingCart.itemsInCart.reduce(0) { $0 + $1.price }
  }

  var totalPriceAfterDiscount: Double {
    return totalPrice - (totalPrice * shoppingCart.discountPercentage)
  }

  var body: some View {
    Form {
      Section("Payment Information") {
        Picker("Payment Type", selection: $paymentType) {
          ForEach(paymentTypes, id: \.self) {
            Text($0)
          }
        }

        if paymentType == "Credit Card" {
          TextField("Enter card number", text: $creditCardNumber.animation())
        }
      }

      Section("Total") {
        Text("Total Amount: $\(String(format: "%.2f", totalPrice))")

        Toggle("Do you have a discount code?", isOn: $hasDiscountCode)
          .tint(Color("HomescreenColor"))

        if hasDiscountCode {
          HStack {
            TextField("Enter Discount Code", text: $discountField)
              .multilineTextAlignment(.center)
              .frame(
                width: Constants.ShoppingCart.discountCodeTextFieldWidth,
                height: Constants.ShoppingCart.discountCodeTextFieldHeight
              )
              .textFieldStyle(.roundedBorder)
              .autocapitalization(.none)
            Button {
              shoppingCart.calculateDiscountPercentage(discountCode: discountField)
            } label: {
              Text("Apply")
                .padding(.leading, Constants.CheckOut.applyButtonPadding)
            }
          }

          Text("Total after discount: $\(String(format: "%.2f", totalPriceAfterDiscount))")
        }
      }

      Section {
        Button {
          // create a new Order instance to store the order
          let newOrder = Order(orderItems: shoppingCart.itemsInCart, date: Date.now, totalPrice: totalPrice)
          orders.ordersPlaced.append(newOrder)
          
          // check if any items in the shopping cart are also on the wishlist
          // if so, then remove the item from the wishlist since it was just purchased
          for item in shoppingCart.itemsInCart where wishlist.items.contains(item) {
            // force unwrap used here because we know for sure that item is in wishlist
            let indexOfWishListItem = wishlist.items.firstIndex(of: item)!
            wishlist.items.remove(at: indexOfWishListItem)
          }

          // empty the cart and show a modal to the user that order was successful
          shoppingCart.itemsInCart.removeAll()
          showOrderConfirmed.toggle()

          // ADD A CONFETTI ANIMATION WHEN USER COMPLETES PURCHASE
        } label: {
          PlaceOrderButton()
        }
        .listRowBackground(Color.clear)
      }

      Section {
        DateAttributedStringView()
          .listRowBackground(Color.clear)
      }

    } // end of Form
    .navigationTitle("Checkout")
    .navigationBarTitleDisplayMode(.inline)
    .alert("Order Confirmed", isPresented: $showOrderConfirmed) {
      // add buttons here
    } message: {
      Text("Thank you!")
    }

  } // end of body property
} // end of CheckOutView

struct CheckOutView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      CheckOutView()
        .environmentObject(ShoppingCartViewModel())
        .environmentObject(WishListViewModel())
    }
  }
}
