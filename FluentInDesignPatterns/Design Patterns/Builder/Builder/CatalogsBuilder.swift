//
//  CatalogsBuilder.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import UIKit

final class CatalogsBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        var presenter: CatalogsPresenterInterface = CatalogsPresenter()
        let netwoking: CatalogsNetworkingInterface = CatalogsNetworking()
        let interactor: CatalogsInteractorInterface = CatalogsInteractor(presenter: presenter, networking: netwoking)
        let viewController: CatalogsViewController = CatalogsViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
