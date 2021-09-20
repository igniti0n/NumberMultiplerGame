//
//  QuestionsCoordinator.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation

class QuestionsCoordinator: ObservableObject {
  @Published var questionsViewModel: QuestionsViewModel!
  
  init() {
    questionsViewModel = QuestionsViewModel(coordinator: self)
  }
  
  
  
}
