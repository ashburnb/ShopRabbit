//
//  LaunchscreenViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/9/23.
//

import Foundation

// these phases control the launchscreen animation
enum LaunchscreenPhase {
  case first, second, completed
}

final class LaunchscreenViewModel: ObservableObject {
  @Published private(set) var state: LaunchscreenPhase = .first

  // when this method is called, it will transition the launchscreen animation to end
  // once the state property becomes completed, the @main App file will no longer show the LaunchscreenView
  func dismiss() {
    self.state = .second
//    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//      self.state = .completed
//    }

    // updated to newer async/await concurrency model
    Task { @MainActor in
      try await Task.sleep(until: .now + .seconds(1), clock: .continuous)
      self.state = .completed
    }
  } // end of dismiss method

}
