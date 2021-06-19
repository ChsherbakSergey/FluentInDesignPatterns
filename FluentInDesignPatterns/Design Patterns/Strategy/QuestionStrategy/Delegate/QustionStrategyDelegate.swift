//
//  QustionStrategyDelegate.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import Foundation

protocol QuestionStrategyDelegate: class {
    
    func questionStrategyRanOutOfQuestions(_ questionStrategy: QuestionStrategy)
}
