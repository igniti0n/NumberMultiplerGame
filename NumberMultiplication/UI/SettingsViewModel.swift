//
//  SettingsViewModel.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation

class SettingsViewModel: ObservableObject {
  @Published var settings: Settings!
  //this is not used, but it can be used for navigation, for ex pushing a screen is using a
  //navigation view
  private unowned let coordinator: SettingsCoordinator
  
  init(coordinator: SettingsCoordinator) {
    self.coordinator = coordinator
    settings = UserDefaultsService.readFromDefaults() ?? Settings.defaultSettings
  }
  
  func increaseMaxNumber() {
    if settings.maxNumber != 12 {
      settings.maxNumber += 1
    }
  }
  
  func decreaseMaxNumber() {
    if settings.maxNumber != 1 {
      settings.maxNumber -= 1
    }
  }
  
  func saveSettingsToDefaults() {
    print("Saving settings from defaults.")
    UserDefaultsService.saveToDefaults(settings: settings)
  }

}
