//
//  QuestionsCoordinatorView.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation
import SwiftUI

struct QuestionsCoordinatorView: View {
  @ObservedObject private var questionsCoordinator: QuestionsCoordinator
  
  init(questionsCoordinator: QuestionsCoordinator) {
    self.questionsCoordinator = questionsCoordinator
  }
  
  var body: some View {
    return QuestionsView(viewModel: questionsCoordinator.questionsViewModel)
  }
}
