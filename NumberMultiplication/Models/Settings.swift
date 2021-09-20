//
//  Settings.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation

enum NumberOfQuestions: Int, CaseIterable, Codable {
  case five = 5
  case ten = 10
  case fifteen = 15
  case all = -1
}

struct Settings: Codable {
  static let defaultSettings = Settings(maxNumber: 4, questionNumbers: .five)
  
  var maxNumber: Int
  var questionNumbers: NumberOfQuestions
}
