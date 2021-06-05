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
        
        #if SINGLETON
        return SingletonCoordinator(navigationController: UINavigationController())
        #else
        return MainCoordinator(navigationController: UINavigationController())
        #endif
    }
    
}
