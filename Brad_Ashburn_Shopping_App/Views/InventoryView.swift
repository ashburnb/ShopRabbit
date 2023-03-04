//
//  InventoryView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/23/23.
//

import SwiftUI

struct InventoryView: View {
  @State var storeInventory = Inventory()
  @Binding var showInventoryView: Bool
  
  var body: some View {
    
    NavigationView {
      List {
        ForEach(storeInventory.totalInventory.keys.sorted(), id: \.id) { item in
          NavigationLink {
            ItemDetailsView(item: item)
          } label: {
            HStack() {
              Image("\(item.imageURL ?? "imagenotfound")")
                .resizable()
                .scaledToFit()
                .padding(Constants.Inventory.imagePadding)
              
              VStack(alignment: .leading) {
                Text("\(item.name)")
                  .font(.title)
                  .fontWeight(.heavy)
                
                Text("\(item.description)")
                  .font(.body)
                Text(item.price, format: .currency(code: "USD"))
                  .font(.title3)
              }
            } // end of HStack
          }

        } // end of ForEach
      } // end of List
      .scrollContentBackground(.hidden)
      .navigationTitle("Inventory")
      .toolbar {
        Button {
          showInventoryView.toggle()
        } label: {
          Text("Back")
        }

      }
    } // end of NavigationView
  } // end of body property
} // end of InventoryView struct


struct InventoryView_Previews: PreviewProvider {
  static let showInventoryView = Binding.constant(false)
  
  static var previews: some View {
    InventoryView(showInventoryView: showInventoryView)
  }
}

