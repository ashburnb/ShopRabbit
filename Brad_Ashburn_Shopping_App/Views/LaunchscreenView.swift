//
//  LaunchscreenView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/9/23.
//

import SwiftUI

struct LaunchscreenView: View {
  @EnvironmentObject var launchscreenModel: LaunchscreenViewModel
  @State private var firstPhaseAnimating = false
  @State private var secondPhaseAnimating = false
  private let timer = Timer.publish(every: 0.70,
                                    on: .main,
                                    in: .common).autoconnect()

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
          .scaleEffect(firstPhaseAnimating ? 0.4 : 1)
          .scaleEffect(secondPhaseAnimating ? 2 : 1)

      } // end of VStack
    } // end of ZStack
    .opacity(secondPhaseAnimating ? 0 : 1)
    .onReceive(timer) { _ in
      switch launchscreenModel.state {
      case .first:
        withAnimation(.spring()) {
          firstPhaseAnimating.toggle()
        }
      case .second:
        withAnimation(.easeInOut) {
          secondPhaseAnimating.toggle()
        }
      default:
        break
      }
    }
    .task {
      do {
        try await Task.sleep(until: .now + .seconds(3), clock: .continuous)
        launchscreenModel.dismiss()
      } catch {}
    }

  } // end of body property
}

struct LaunchscreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchscreenView()
          .environmentObject(LaunchscreenViewModel())
    }
}
