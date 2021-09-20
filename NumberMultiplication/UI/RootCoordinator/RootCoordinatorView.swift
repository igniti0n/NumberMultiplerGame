//
//  RootCoordinatorView.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation
import SwiftUI

struct RootCoordinatorView: View {
  
  @ObservedObject private var rootCoordinator: RootCoordinator
  
  init(rootCoordinator: RootCoordinator) {
    self.rootCoordinator = rootCoordinator
  }
  
  var body: some View {
    MainCoordinatorView(mainCoordinator: rootCoordinator.mainCoordinator)
      
  }
  
}
