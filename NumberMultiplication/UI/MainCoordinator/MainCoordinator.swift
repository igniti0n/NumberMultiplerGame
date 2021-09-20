//
//  MainCoordinator.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation
import SwiftUI

enum MainTabSelection {
  case questions
  case settings
}

class MainCoordinator: ObservableObject {
  @Published var settingsCoordinator = SettingsCoordinator()
  @Published var questionsCoordinator = QuestionsCoordinator()
  @Published var selectedTab: MainTabSelection = .settings {
    didSet {
      if oldValue == .settings {
        settingsCoordinator.settingsViewModel.saveSettingsToDefaults()
        questionsCoordinator.questionsViewModel.startGame()
      }
    }
  }

}
