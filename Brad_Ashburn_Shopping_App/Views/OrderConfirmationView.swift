//
//  OrderConfirmationView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/12/23.
//

import SwiftUI
import ConfettiSwiftUI

struct OrderConfirmationView: View {
  @State private var difference: Double = 0
  @State private var confettiLaunch: Int = 0
  @State private var scale = 0.5
  @Binding var showConfirmation: Bool
  @Binding var carrotPointsEarnedFromOrder: Int
  @EnvironmentObject var orders: OrdersViewModel

  let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

  var body: some View {
    VStack {

      VStack {

        Text("Order\nSuccesful!")
          .multilineTextAlignment(.center)
          .font(.system(size: 60, weight: .black, design: .rounded))
          .foregroundStyle(
            LinearGradient(
              colors: [.red, .orange, .yellow, .green, .blue, .indigo],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
          .shadow(
            color: .gray,
            radius: 3,
            x: -2,
            y: 2
          )

      }
      .scaleEffect(scale)
      .onAppear {
        let animate = Animation.easeInOut(duration: 0.5)
        withAnimation(animate) {
          scale = 1
        }
        difference += 1
        confettiLaunch += 1
      }
      .onReceive(timer) { _ in
        showConfirmation.toggle()
    }
      Spacer()

      Image("rabbit")
        .resizable()
        .scaledToFit()
        .frame(width: 300)
        .scaleEffect(scale)
        .confettiCannon(counter: $confettiLaunch,
                        confettiSize: 30,
                        radius: 500,
                        repetitions: 3,
                        repetitionInterval: 0.5)
      Text("You earned +\(carrotPointsEarnedFromOrder) carrot points")
        .font(.largeTitle)
        .multilineTextAlignment(.center)

      Spacer()
    }
  }
}

struct OrderConfirmationView_Previews: PreviewProvider {
  static var previews: some View {
    OrderConfirmationView(showConfirmation: .constant(false), carrotPointsEarnedFromOrder: .constant(100))
      .environmentObject(OrdersViewModel())
  }
}
