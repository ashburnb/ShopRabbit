//
//  HomeScreenView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 2/16/23.
//

import SwiftUI

struct HomescreenView: View {
  var body: some View {
    ZStack {
      Color("HomescreenColor")
        .ignoresSafeArea()
      
      VStack {
        HomescreenTitleView(text: "Shop Rabbit")
          .padding(.top, Constants.Homescreen.titleTextTopPadding)
        
        Image("HomescreenRabbit")
          .resizable()
          .scaledToFit()
        
        InventoryView()
      } // end of VStack
      .padding(.bottom, 20)
    } // end of ZStack
  } // end of body property
}


struct HomescreenView_Previews: PreviewProvider {
  static var previews: some View {
    HomescreenView()
  }
}
