//
//  SettingsCoordinator.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation

class SettingsCoordinator: ObservableObject {
  @Published var settingsViewModel: SettingsViewModel!
  
  init() {
    settingsViewModel = SettingsViewModel(coordinator: self)
  }
}
