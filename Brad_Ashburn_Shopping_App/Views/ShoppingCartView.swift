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
          .frame(width: 200, height: 60)
          .border(.orange)
        
        Text("Total after Discount: $\(String(format: "%.2f", shoppingCart.totalAmountAfterDiscount))")
      } // end of VStack
      
    } // end of NavigationView
  } // end of body property
}

struct ShoppingCartView_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCartView(shoppingCart: .constant(ShoppingCart()), showShoppingCart: .constant(false))
  }
}
