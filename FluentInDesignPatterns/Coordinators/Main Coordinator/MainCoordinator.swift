//
//  MainCoordinator.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/5/21.
//

import UIKit

final class MainCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    //MARK: - Present Methods
    
    
    //MARK: - Dismiss Methods
    
}
