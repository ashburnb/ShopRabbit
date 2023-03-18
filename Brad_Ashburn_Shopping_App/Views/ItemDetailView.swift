//
//  ItemDetailView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import SwiftUI

struct ItemDetailView: View {
  let item: Item
  @EnvironmentObject var shoppingCart: ShoppingCart
  @State var showItemAdded = false
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: Constants.ItemDetails.vstackSpacing) {
        HStack {
          Spacer()
          AsyncImage(
            url: URL(string: item.image),
            content: { image in
              image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                  width: Constants.ItemDetails.imageWidth,
                  height: Constants.ItemDetails.imageHeight
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
        Text(item.description)
        
        HStack {
          Spacer()
          
          Button {
            shoppingCart.itemsInCart.append(item)
            showItemAdded.toggle()
          } label: {
            AddToCartButton()
          }
        }
        .alert("Added to Cart", isPresented: $showItemAdded) {
          // add buttons here
        } message: {
          Text("\(item.title)")
        }
      } // end of VStack
      .padding(Constants.ItemDetails.vstackPadding)
    }
  }
}

struct ItemDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(ShoppingCart())
  }
}
