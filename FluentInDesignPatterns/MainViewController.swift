//
//  MainViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/5/21.
//

import UIKit

final class MainViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
    }
}

//MARK: - UI
private extension MainViewController {
    
    func setupInitialUI() {
        view.backgroundColor = .systemRed
    }
}
