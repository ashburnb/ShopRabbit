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
  @State private var discountField: String = ""
  @State private var showOrderConfirmed = false
  
  var totalPrice: Double {
    return shoppingCart.itemsInCart.reduce(0) { $0 + $1.price }
  }
  
  var totalPriceAfterDiscount: Double {
    return totalPrice - (totalPrice * shoppingCart.discountPercentage)
  }
  
  
  var dateAttributedString: AttributedString {
    var customDateDisplay = Date.now.formatted(.dateTime.hour().minute().attributed)
    
    // modifies color of hour
    let hour = AttributeContainer.dateField(.hour)
    let hourStyle = AttributeContainer.foregroundColor(.orange)
    
    // modifies color of minutes
    let minute = AttributeContainer.dateField(.minute)
    let minuteStyle = AttributeContainer.foregroundColor(.orange)
    
    // replace the default String attributes with custom ones
    customDateDisplay.replaceAttributes(hour, with: hourStyle)
    customDateDisplay.replaceAttributes(minute, with: minuteStyle)
    
    // all computed properties must return their result
    return customDateDisplay
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
        
        HStack {
          TextField("Enter Discount Code", text: $discountField)
            .multilineTextAlignment(.center)
            .frame(
              width: Constants.ShoppingCart.discountCodeTextFieldWidth,
              height: Constants.ShoppingCart.discountCodeTextFieldHeight
            )
            .border(.orange)
            .autocapitalization(.none)
          Button {
            //shoppingCart.discountCode = discountField
            shoppingCart.calculateDiscountPercentage(discountCode: discountField)
          } label: {
            Text("Apply")
          }
        }
        
        Text("Total after Discount: $\(String(format: "%.2f", totalPriceAfterDiscount))")
      }
      
      Section {
        Button {
          shoppingCart.itemsInCart.removeAll()
          showOrderConfirmed.toggle()
        } label: {
          HStack {
            Spacer()
            Text("Place Order")
              .padding()
              .background(Color("HomescreenColor"))
              .foregroundColor(.white)
              .font(.title2)
              .bold()
              .cornerRadius(20)
            Spacer()
          }
        }
      
      }
      
      HStack {
        Spacer()
        Text("\(dateAttributedString)")
          .padding(.vertical, Constants.ShoppingCart.attributedStringPadding)
        Spacer()
      }
      .listRowBackground(Color.clear)
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
