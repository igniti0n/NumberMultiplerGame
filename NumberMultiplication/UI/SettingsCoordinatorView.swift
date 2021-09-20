//
//  SettingsCoordinatorView.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation
import SwiftUI

struct SettingsCoordinatorView: View {
  @ObservedObject private var settingsCoordinator: SettingsCoordinator
  
  init(settingsCoordinator: SettingsCoordinator) {
    self.settingsCoordinator = settingsCoordinator
  }
  
  var body: some View {
    SettingsView(viewModel: settingsCoordinator.settingsViewModel)
      .padding()
  }
}
