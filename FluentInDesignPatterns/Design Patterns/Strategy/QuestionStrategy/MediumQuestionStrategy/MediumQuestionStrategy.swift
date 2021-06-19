//
//  MediumQuestionStrategy.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import Foundation

final class MediumQuestionStrategy: QuestionStrategy {
    
    weak var delegate: QuestionStrategyDelegate?
    
    var groupTitle: String = "Medium"
    
    var questions: [Question] = [
        Question(title: "The first country in the world to use postcards was the United States of America.", isTruth: false),
        Question(title: "Tea contains more caffeine than coffee and soda.", isTruth: false),
        Question(title: "Dogs have an appendix.", isTruth: false),
        Question(title: "Mice have more bones than humans.", isTruth: true)
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

