//
//  QuestionsViewModel.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 19.09.2021..
//

import Foundation

class QuestionsViewModel: ObservableObject, Identifiable {
  @Published var questions = Array<Question>()
  @Published var possibleAnswers = Array<Int>()
  @Published var questionText = ""
  @Published var score = 0
  @Published var isGameover = false
  
  var settings: Settings
  
  private var currentQuestion = 0
  //this is not used, but it can be used for navigation, for ex pushing a screen is using a
  //navigation view
  private unowned let coordinator: QuestionsCoordinator
  
  init(coordinator: QuestionsCoordinator) {
    self.coordinator = coordinator
    settings = Settings.defaultSettings
  }
  
}

extension QuestionsViewModel {
  // MARK: - Public functions
  func startGame() {
    readSettingsFromDefaults()
    generateQuestions()
    setUpValues()
  }
  
  func onQuestionAnswered(answer: Int) {
    updateScore(answer: answer)
    currentQuestion += 1
    if currentQuestion >= questions.count {
      isGameover = true
    }else{
      questionText = questions[currentQuestion].questionText
      setUpPossibleAnswers()
    }
  }
  
}

private extension QuestionsViewModel {
  // MARK: - Private functions
  func readSettingsFromDefaults() {
    settings = UserDefaultsService.readFromDefaults() ?? Settings.defaultSettings
  }
  
  func generateQuestions() {
    let numbers = Array<Int>(1...settings.maxNumber)
    let numberOfQuestions = settings.questionNumbers.rawValue
    var possibleQuestions = Array<Question>()
    
    for numbA in numbers {
      for numbB in numbers {
        possibleQuestions.append(Question(questionText: "What is \(numbA) times \(numbB)?", questionAnswer: numbA * numbB))
      }
    }
    
    if numberOfQuestions > 0 {
      let arraySlice = possibleQuestions.shuffled().dropFirst(numberOfQuestions)
      if arraySlice.isEmpty {
        questions = possibleQuestions
      }else{
        questions = Array<Question>(arraySlice)
      }
    }else {
      questions = possibleQuestions.shuffled()
    }
    print(questions)
  }
  
  func setUpValues() {
    currentQuestion = 0
    questionText = questions[currentQuestion].questionText
    score = 0
    setUpPossibleAnswers()
  }
  
  func setUpPossibleAnswers() {
    let rightAnswer = questions[currentQuestion].questionAnswer
    let falseAnswerOne = rightAnswer - (1...4).randomElement()!
    let falseAnswerTwo = rightAnswer + (1...4).randomElement()!
    possibleAnswers = [rightAnswer,falseAnswerOne,falseAnswerTwo].shuffled()
  }
  
  func updateScore(answer: Int) {
    if answer == questions[currentQuestion].questionAnswer {
      score += 1
    }else{
      score -= 1
    }
  }
}
