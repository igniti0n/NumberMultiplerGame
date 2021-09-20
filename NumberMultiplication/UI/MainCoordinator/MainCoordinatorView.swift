//
//  MainCoordinatorView.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation
import SwiftUI

struct MainCoordinatorView: View {
  @ObservedObject private var mainCoordinator: MainCoordinator
  
  init(mainCoordinator: MainCoordinator) {
    self.mainCoordinator = mainCoordinator
  }
  
  var body: some View {
    return TabView(selection: $mainCoordinator.selectedTab) {
      SettingsCoordinatorView(settingsCoordinator: mainCoordinator.settingsCoordinator)
        .tabItem { Text("Settings") }
        .tag(MainTabSelection.settings)
      
      QuestionsCoordinatorView(questionsCoordinator: mainCoordinator.questionsCoordinator)
        .tabItem { Text("Game") }
        .tag(MainTabSelection.questions)
  
    }
  }
  
}
