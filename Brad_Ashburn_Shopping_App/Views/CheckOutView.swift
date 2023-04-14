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
  @State private var showConfirmation = false
  @State private var carrotPointsEarnedFromOrder = 0
  @AppStorage("firstName") var firstName = ""
  @AppStorage("lastName") var lastName = ""
  @AppStorage("address") var address = ""
  @AppStorage("city") var city = ""
  @AppStorage("state") var state = ""
  @AppStorage("zipCode") var zipCode = ""

  let states = ["Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas",
                        "California", "Colorado", "Connecticut", "Delaware",
                        "District of Columbia", "Florida", "Georgia", "Guam", "Hawaii", "Idaho",
                        "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine",
                        "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi",
                        "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
                        "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota",
                        "Northern Mariana Islands", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
                        "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
                        "U.S. Virgin Islands", "Utah", "Vermont", "Virginia", "Washington",
                        "West Virginia", "Wisconsin", "Wyoming"]

  var totalPrice: Double {
    return shoppingCart.itemsInCart.reduce(0) { $0 + $1.price }
  }

  var totalPriceAfterDiscount: Double {
    guard let discountPercentage = shoppingCart.discountPercentage else {
      return totalPrice
    }

    return totalPrice - (totalPrice * (shoppingCart.discountPercentage ?? 0))
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

      Section("Billing Information") {
        TextField("First Name", text: $firstName)
        TextField("Last Name", text: $lastName)
        TextField("Address", text: $address)
        TextField("City", text: $city)
        Picker("State", selection: $state) {
          ForEach(states, id: \.self) {
            Text($0)
          }
        }
        TextField("Zipcode", text: $zipCode)
      }

      Section("Total") {
        Text("Total Amount: $\(String(format: "%.2f", totalPrice))")

        Toggle("Do you have a discount code?", isOn: $hasDiscountCode)
          .tint(Color("OnboardingColor"))

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
              shoppingCart.discountPercentage =  shoppingCart.calculateDiscountPercentage(using: discountField)

              // NEED TO ADD IN FUNCTIONALITY TO SHOW USER THAT AN INVALID CODE WAS ENTERED
              
              // after usage, code is removed from the dictionary
              shoppingCart.removeDiscountCode(discountField)
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

          // add carrotPoints to running total
          carrotPointsEarnedFromOrder = Int(10 * totalPrice)
          orders.carrotPoints += carrotPointsEarnedFromOrder

          // empty the cart and show a modal to the user that order was successful
          shoppingCart.itemsInCart.removeAll()
          showConfirmation.toggle()

        } label: {
          PlaceOrderButton()
        }
        .listRowBackground(Color.clear)
      }

    } // end of Form
    .navigationTitle("Checkout")
    .navigationBarTitleDisplayMode(.inline)
    .fullScreenCover(isPresented: $showConfirmation) {
      OrderConfirmationView(showConfirmation: $showConfirmation, carrotPointsEarnedFromOrder: $carrotPointsEarnedFromOrder)
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
