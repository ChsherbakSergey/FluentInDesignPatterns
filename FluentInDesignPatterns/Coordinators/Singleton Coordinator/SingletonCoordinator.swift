//
//  SingletonCoordinator.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/5/21.
//

import UIKit
import SafariServices

final class SingletonCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if AuthManager.shared.isSignedIn {
            guard let username = AuthManager.shared.username else {
                pushHomeVC(username: "Stranger")
                return
            }
            pushHomeVC(username: username)
        } else {
            pushAuthorizationVC()
        }
    }
    
    //MARK: - Push Methods
    func pushAuthorizationVC() {
        let vc = AuthorizationViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        if navigationController.viewControllers.count > 1 {
            navigationController.viewControllers = [vc]
        }
    }
    
    func pushHomeVC(username: String) {
        let vc = HomeViewController(username: username)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        if navigationController.viewControllers.count > 1 {
            navigationController.viewControllers = [vc]
        }
    }
    
    func pushExplanationVC() {
        let vc = SingletonExplanationViewController()
        vc.coordinator = self
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController.pushViewController(vc, animated: true)
    }
    
    //MARK: - Present Methods
    func presentTwitterVC(with url: URL?) {
        guard let url = url else { return }
        let vc = SFSafariViewController(url: url)
        navigationController.present(vc, animated: true)
    }
}
