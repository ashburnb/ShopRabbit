////
////  HomeScreenView.swift
////  Brad_Ashburn_Shopping_App
////
////  Created by Brad Ashburn on 2/16/23.
////
//
//import SwiftUI
//
//struct HomescreenView: View {
//  @Environment(\.horizontalSizeClass) var horizontalSizeClass
//  @Environment(\.verticalSizeClass) var verticalSizeClass
//
//  var body: some View {
//    ZStack {
//      // portrait orientation
//      if horizontalSizeClass == .compact && verticalSizeClass == .regular {
//        Color("HomescreenColor")
//          .edgesIgnoringSafeArea(.top)
//      } else {
//        // landscape orientation
//        Color("HomescreenColor")
//          .edgesIgnoringSafeArea(.horizontal)
//      }
//
//      VStack {
//        HomescreenTitleView(text: "ShopRabbit")
//          .padding(.top, Constants.Homescreen.titleTextTopPadding)
//
//        Image("HomescreenRabbit")
//          .resizable()
//          .scaledToFit()
//
//      } // end of VStack
//    } // end of ZStack
//
//  } // end of body property
//}
//
//struct HomescreenView_Previews: PreviewProvider {
//  static var previews: some View {
//    HomescreenView()
//  }
//}
