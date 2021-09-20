//
//  QuestionsView.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation
import SwiftUI

struct QuestionsView: View {
  @ObservedObject var viewModel: QuestionsViewModel
  
  @State private var rotatedAngle: Double = 0
  
  var body: some View {
    VStack(alignment: .center, spacing: 40) {
      Text("\(viewModel.questionText)")
      HStack(alignment: .center, spacing: 10) {
        ForEach(0..<viewModel.possibleAnswers.count) { index in
          let buttonNumber = viewModel.possibleAnswers[index]
          Button("\(buttonNumber)") {
            viewModel.onQuestionAnswered(answer: buttonNumber)
            rotatedAngle += 360
          }
          .modifier(ButtonStyleWithFlippedAnimation(rotatedAngle: rotatedAngle, index: index))
        }
      }
      Text("Score: \(viewModel.score)")
        .onAppear {
          rotatedAngle = 360
        }.onDisappear {
          rotatedAngle = 0
        }
    }.alert(isPresented: $viewModel.isGameover) {
      Alert(title: Text("Game over!"), message: Text("Your score is: \(viewModel.score)"), dismissButton: .destructive(Text("Do again!"), action: {
        viewModel.startGame()
      }))
    }
  }
  
}


struct ButtonStyleWithFlippedAnimation: ViewModifier {
  let rotatedAngle: Double
  let index: Int
  
  func body(content: Content) -> some View {
    content
      .frame(width: 100, height: 100, alignment: .center)
      .background(Color.blue)
      .foregroundColor(Color.white)
      .clipShape(Capsule())
      .rotation3DEffect(Angle(degrees: rotatedAngle), axis: (0, 1, 0),anchor: .center)
      .animation(Animation.easeOut(duration: 0.3).delay(Double(index)/8))
  }
}
