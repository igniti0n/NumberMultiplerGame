//
//  RootCoordinator.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation


class RootCoordinator: ObservableObject {
  @Published var mainCoordinator: MainCoordinator!
  
  init() {
    self.mainCoordinator = MainCoordinator()
  }
  
}
