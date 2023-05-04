//
//  NetworkMonitor.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/25/23.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
  private let monitor = NWPathMonitor()
  private let queue = DispatchQueue(label: "Monitor")
  var isActive = false
  var isExpensive = false
  var isConstrained = false
  var connectionType = NWInterface.InterfaceType.other

  init() {
    monitor.pathUpdateHandler = { path in
      self.isActive = path.status == .satisfied
      self.isExpensive = path.isExpensive
      self.isConstrained = path.isConstrained

      let connectionTypes: [NWInterface.InterfaceType] = [.cellular, .wifi, .wiredEthernet]

      self.connectionType = connectionTypes.first(where: path.usesInterfaceType) ?? .other

      Task { @MainActor in
        self.objectWillChange.send()
      }

    }
    monitor.start(queue: queue)
  }

}
