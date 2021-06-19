//
//  QuestionStrategy.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import Foundation

protocol QuestionStrategy {
    
    var delegate: QuestionStrategyDelegate? { get set }
    
    var groupTitle: String { get }
    
    var questions: [Question] { get }
    var questionIndex: Int { get set }
    
    var numberOfCorrectAnswers: Int { get set }
    var numberOfIncorrectAnswers: Int { get set }
    
    //Here you can get questions from different sources based on which strategy you are going to use
    func fetchQuestions()
    
    func markAsCorrect()
    func markAsIncorrect()
}
