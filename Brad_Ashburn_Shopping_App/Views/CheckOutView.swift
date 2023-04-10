//
//  CheckOutView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/18/23.
//

import SwiftUI

struct CheckOutView: View {
  @EnvironmentObject var shoppingCart: ShoppingCart
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
        .environmentObject(ShoppingCart())
    }
  }
}
