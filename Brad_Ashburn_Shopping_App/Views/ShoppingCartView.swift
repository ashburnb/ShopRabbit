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
          
        }
        Text("Total Amount: $\(String(format: "%.2f", shoppingCart.totalAmount))")
        TextField("Enter Discount Code", text: $shoppingCart.discountCode)
          .multilineTextAlignment(.center)
          .frame(width: 200, height: 60)
          .border(.orange)
        Text("Total after Discount: $\(String(format: "%.2f", shoppingCart.totalAmountAfterDiscount))")
      }
      
    }
    
    
    
  } // end of body property
}

struct ShoppingCartView_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCartView(shoppingCart: .constant(ShoppingCart()), showShoppingCart: .constant(false))
  }
}
