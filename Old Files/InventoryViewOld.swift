////
////  InventoryView.swift
////  Brad_Ashburn_Shopping_App
////
////  Created by Brad Ashburn on 2/23/23.
////
//
//import SwiftUI
//
//struct InventoryView: View {
//  @State var storeInventory = Inventory()
//  @Binding var showInventoryView: Bool
//  @State var shoppingCart = ShoppingCart()
//  @State var showShoppingCart = false
//
//  var body: some View {
//
//    NavigationView {
//      List {
//        ForEach(storeInventory.totalInventory.keys.sorted(), id: \.id) { item in
//          NavigationLink {
//            ItemDetailsView(item: item, shoppingCart: $shoppingCart)
//          } label: {
//            HStack() {
//              Image("\(item.imageURL ?? "imagenotfound")")
//                .resizable()
//                .scaledToFit()
//                .padding(Constants.Inventory.imagePadding)
//
//              VStack(alignment: .leading) {
//                Text("\(item.name)")
//                  .font(.title)
//                  .fontWeight(.heavy)
//
//                Text("\(item.description)")
//                  .font(.body)
//                Text(item.price, format: .currency(code: "USD"))
//                  .font(.title3)
//              }
//            } // end of HStack
//          }
//
//        } // end of ForEach
//      } // end of List
//      .scrollContentBackground(.hidden)
//      .navigationTitle("Inventory")
//      .toolbar {
//        HStack {
//          Button {
//            showShoppingCart.toggle()
//          } label: {
//            Text("Cart")
//            // improved styling of Shopping Cart and Back buttons will be done in the future
//          }
//
//          Button {
//            showInventoryView.toggle()
//          } label: {
//            Text("Back")
//          }
//        }
//      } // end of toolbar
//    } // end of NavigationView
//    .fullScreenCover(isPresented: $showShoppingCart) {
//      ShoppingCartView(shoppingCart: $shoppingCart, showShoppingCart: $showShoppingCart)
//    }
//  } // end of body property
//} // end of InventoryView struct
//
//
//struct InventoryView_Previews: PreviewProvider {
//  static let showInventoryView = Binding.constant(false)
//
//  static var previews: some View {
//    InventoryView(showInventoryView: showInventoryView)
//  }
//}
//
