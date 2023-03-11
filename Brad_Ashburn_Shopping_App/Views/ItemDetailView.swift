//
//  ItemDetailView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/10/23.
//

import SwiftUI

struct ItemDetailView: View {
  let item: Item
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 20) {
        HStack {
          Spacer()
          AsyncImage(
            url: URL(string: item.image),
            content: { image in
              image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
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
      } // end of VStack
      .padding(20)
    }
  }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}
