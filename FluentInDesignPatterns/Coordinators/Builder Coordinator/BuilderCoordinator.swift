//
//  BuilderCoordinator.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

final class BuilderCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openCatalogsVC()
    }
    
    //MARK: - Push Methods
    func openCatalogsVC() {
        guard let vc = CatalogsBuilder().build() as? CatalogsViewController else { return }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
