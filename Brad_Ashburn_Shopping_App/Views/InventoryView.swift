//
//  InventoryView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/23/23.
//

import SwiftUI

struct InventoryView: View {
  @State var storeInventory = Inventory()
  
  
  var body: some View {
    
    NavigationView {
      List {
        ForEach(storeInventory.totalInventory.keys.sorted(), id: \.id) { item in
          VStack(alignment: .leading) {
            
            HStack {
              Text("\(item.name)")
              Spacer()
              Text(item.price, format: .currency(code: "USD"))
            }
            
            Text("\(item.description)")
              
          } // end of VStack
        } // end of ForEach

      }
      .navigationTitle("Inventory")
      .toolbar {
        Button {
          HomescreenView()
        } label: {
          Text("Back")
        }

      }
    }
    
  }
  
} // end of InventoryView struct


struct InventoryView_Previews: PreviewProvider {
  static var previews: some View {
    InventoryView()
  }
}

