//
//  SingletonCoordinator.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/5/21.
//

import UIKit

final class SingletonCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SingletonViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    //MARK: - Present Methods
    
    
    //MARK: - Dismiss Methods
    
}
