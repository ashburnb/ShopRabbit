//
//  LaunchscreenViewModel.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/9/23.
//

import Foundation

enum LaunchscreenPhase {
  case first, second, completed
}

final class LaunchscreenViewModel: ObservableObject {
  @Published private(set) var state: LaunchscreenPhase = .first

  func dismiss() {
    self.state = .second
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.state = .completed
    }
  }

}
