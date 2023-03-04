//
//  ItemDetailsView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/4/23.
//

import SwiftUI

struct ItemDetailsView: View {
  var item: Item
  @State private var showItemAdded = false
  @State private var showShoppingCart = false
  
  var body: some View {
    VStack {
      Text("\(item.name)")
      Text("\(item.description)")
      
      Button {
        // adds item to cart
        showItemAdded.toggle()
      } label: {
        Text("Add to cart")
          .frame(width: 200, height: 60)
          .foregroundColor(.white)
          .background(.green)
          .cornerRadius(20)
          .font(.title)
          .bold()
      }

    }
    .sheet(isPresented: $showItemAdded) {
      VStack {
        Text("\(item.name) added successfully")
        HStack {
          Button {
            //
          } label: {
            Text("Go back")
          }
          
          Button {
            showShoppingCart.toggle()
          } label: {
            Text("Go to Cart")
          }
        }
      }
      .fullScreenCover(isPresented: $showShoppingCart) {
        ShoppingCartView()
      }
    }
  } // end of body property
}


struct ItemDetailsView_Previews: PreviewProvider {
  static let sampleItem = Item(id: 808, name: "Name", price: 88.88, description: "Sample item", category: nil, imageURL: nil)
  
  static var previews: some View {
    ItemDetailsView(item: sampleItem)
  }
}
