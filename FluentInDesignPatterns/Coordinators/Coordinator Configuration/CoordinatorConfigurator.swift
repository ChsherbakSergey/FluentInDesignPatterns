//
//  CoordinatorConfigurator.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/5/21.
//

import UIKit

final class CoordinatorConfigurator {
    
    static let shared: CoordinatorConfigurator = CoordinatorConfigurator()
    
    /// This methods return a coordinator based on which scheme is used
    func setupInitialCoordinator() -> Coordinatable {
        
        let navigationController: UINavigationController = UINavigationController()
        
        #if SINGLETON
        return SingletonCoordinator(navigationController: navigationController)
        #elseif STATE
        return StateCoordinator(navigationController: navigationController)
        #elseif STRATEGY
        return StrategyCoordinator(navigationController: navigationController)
        #else
        return MainCoordinator(navigationController: navigationController)
        #endif
    }
    
}
