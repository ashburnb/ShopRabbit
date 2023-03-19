//
//  ShoppingCartView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/11/23.
//

import SwiftUI

struct ShoppingCartView: View {
  @EnvironmentObject var shoppingCart: ShoppingCart
  
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(shoppingCart.itemsInCart, id: \.self) { item in
            HStack {
              AsyncImage(
                url: URL(string: item.image),
                content: { image in
                  image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                      width: 50,
                      height: 50
                    )
                },
                placeholder: {
                  ProgressView()
                }
              )
              
              Spacer()
              
              Text(item.title)
             
              Spacer()
              
              Text("$\(String(format: "%.2f", item.price))")
            }
          }
          .onDelete(perform: deleteItems)
        }
        .navigationTitle("Shopping Cart")
        
        NavigationLink {
          CheckOutView()
        } label: {
          Text("Checkout")
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .font(.title2)
            .bold()
            .cornerRadius(20)
        }
        .disabled(shoppingCart.itemsInCart.isEmpty)
        
      } // end of VStack
      .navigationBarTitleDisplayMode(.inline)
//      .toolbar {
//        EditButton()
//      }
      
    } // end of NavigationView
    
  } // end of body property
  
  func deleteItems(at offsets: IndexSet) {
    shoppingCart.itemsInCart.remove(atOffsets: offsets)
  }
}

struct ShoppingCartView_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCartView()
      .environmentObject(ShoppingCart())
  }
}
