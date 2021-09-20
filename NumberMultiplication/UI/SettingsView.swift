//
//  SettingsView.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 20.09.2021..
//

import Foundation
import SwiftUI

struct SettingsView: View {
  @ObservedObject var viewModel: SettingsViewModel
  
  var body: some View {
    Form{
      Section(header: Text("Maxixmum number multiplier")) {
        Stepper("Max: \(viewModel.settings.maxNumber)") {
          viewModel.increaseMaxNumber()
        } onDecrement: {
          viewModel.decreaseMaxNumber()
        }
      }
      Section(header: Text("Number of questions")) {
        Picker("", selection: $viewModel.settings.questionNumbers) {
          Text("Five").tag(NumberOfQuestions.five)
          Text("Ten").tag(NumberOfQuestions.ten)
          Text("Fifteen").tag(NumberOfQuestions.fifteen)
          Text("All").tag(NumberOfQuestions.all)
        }
        .pickerStyle(SegmentedPickerStyle())
      }
    }
    
  }
}
