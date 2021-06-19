//
//  HardQuestionStrategy.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import Foundation

final class HardQuestionStrategy: QuestionStrategy {
        
    weak var delegate: QuestionStrategyDelegate?
    
    var groupTitle: String = "Hard"
    
    var questions: [Question] = [
        Question(title: "The first product with a bar code was chewing gum.", isTruth: true),
        Question(title: "The star is the most common symbol used in all national flags around the world.", isTruth: true),
        Question(title: "The World War II began in 1939 when Germany invaded Poland.", isTruth: true),
        Question(title: "The FIFA World Cup 2022 will take place in Iran.", isTruth: false)
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
