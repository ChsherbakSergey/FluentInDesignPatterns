//
//  StrategyCoordinator.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import UIKit

final class StrategyCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openSelectQuestionsVC()
    }
    
    //MARK: - Push methods
    private func openSelectQuestionsVC() {
        let vc = SelectQuestionsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openQuestionVC(strategy: QuestionStrategy) {
        let vc = QuestionViewController(strategy: strategy)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    //MARK: - Pop Methods
    func closeQuestionVC() {
        navigationController.popViewController(animated: true)
    }
}
