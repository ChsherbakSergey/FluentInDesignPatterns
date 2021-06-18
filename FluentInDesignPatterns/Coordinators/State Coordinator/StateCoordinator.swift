//
//  StateCoordinator.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import UIKit

final class StateCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    //MARK: - Init(-s)
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openSearchMessageVC()
    }
    
    //MARK: - Push Methods
    private func openSearchMessageVC() {
        let vc = SearchMessageViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    internal func openExplanationVC() {
        let vc = StateExplanationViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
