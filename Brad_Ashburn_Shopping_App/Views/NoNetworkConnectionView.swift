//
//  NoNetworkConnectionView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/25/23.
//

import SwiftUI

struct NoNetworkConnectionView: View {
  var body: some View {
    ZStack {
      Color("HomescreenColor")
        .ignoresSafeArea()

      VStack {
        HomescreenTitleView(text: "Shop Rabbit")
          .padding(.top, Constants.Homescreen.titleTextTopPadding)

//        Spacer()

        Image("emptyCartImage")
          .resizable()
          .scaledToFit()
          .frame(width: 400)

        Text("Uh oh! No network connection.\nPlease check your settings.")
          .foregroundColor(.white)
          .font(.title)
          .multilineTextAlignment(.center)
          .padding()
//        Spacer()

      } // end of VStack
    } // end of ZStack
  }
}

struct NoNetworkConnectionView_Previews: PreviewProvider {
  static var previews: some View {
    NoNetworkConnectionView()
  }
}
