//
//  EasyQuestionStrategy.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import Foundation

final class EasyQuestionStrategy: QuestionStrategy {
    
    weak var delegate: QuestionStrategyDelegate?

    var groupTitle: String = "Easy"
    
    var questions: [Question] = [
        Question(title: "In school, Albert Einstein failed most of the subjects, except for physics and math", isTruth: true),
        Question(title: "There are more than 7 billions people on the Earth", isTruth: true),
        Question(title: "The first song ever sung in the space was “Happy Birthday.”", isTruth: true),
        Question(title: "You have learnt strategy pattern", isTruth: true)
    ]
    
    var questionIndex: Int = 0
    
    var numberOfCorrectAnswers: Int = 0
    var numberOfIncorrectAnswers: Int = 0
    
    func fetchQuestions() {
        //Here you can fetch questions but I'm going to simulate them and just hardcode them above
    }
    
    func markAsCorrect() {
        numberOfCorrectAnswers += 1
        checkForAvailableQuestions()
    }
    
    func markAsIncorrect() {
        numberOfIncorrectAnswers += 1
        checkForAvailableQuestions()
    }
    
    //MARK: - Private Methods
    private func checkForAvailableQuestions() {
        guard questionIndex < questions.count - 1 else {
            delegate?.questionStrategyRanOutOfQuestions(self)
            return
        }
        questionIndex += 1
    }
}
