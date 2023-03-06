//
//  ShoppingCartView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/4/23.
//

import SwiftUI

struct ShoppingCartView: View {
  @Binding var shoppingCart: ShoppingCart
  @Binding var showShoppingCart: Bool
  
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
  
  /*
   Future Plans:
   1. Styling will be customized to match the color and rabbit theme
   2. Display of shopping cart items and amounts will be optimized
   3. An ability to remove an item of the cart from this view will be created
  */
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(shoppingCart.itemsInCart) { item in
            HStack {
              Text(item.name)
              Spacer()
              Text("$\(String(format: "%.2f", item.price))")
            }
          }
        }
        .navigationTitle("Shopping Cart")
        .toolbar {
          Button {
            showShoppingCart.toggle()
          } label: {
            Text("Back")
          }
        } // end of toolbar
        
        Text("Total Amount: $\(String(format: "%.2f", shoppingCart.totalAmount))")
        
        TextField("Enter Discount Code", text: $shoppingCart.discountCode)
          .multilineTextAlignment(.center)
          .frame(
            width: Constants.ShoppingCart.discountCodeTextFieldWidth,
            height: Constants.ShoppingCart.discountCodeTextFieldHeight
          )
          .border(.orange)
          .autocapitalization(.none)
        
        Text("Total after Discount: $\(String(format: "%.2f", shoppingCart.totalAmountAfterDiscount))")
        
        Text("\(dateAttributedString)")
          .padding(.top, Constants.ShoppingCart.attributedStringPadding)
      } // end of VStack
      
    } // end of NavigationView
  } // end of body property
}

struct ShoppingCartView_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCartView(shoppingCart: .constant(ShoppingCart()), showShoppingCart: .constant(false))
  }
}
