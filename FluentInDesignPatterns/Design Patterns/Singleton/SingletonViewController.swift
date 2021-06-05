//
//  SingletonViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/5/21.
//

import UIKit

final class SingletonViewController: UIViewController {
    
    weak var coordinator: SingletonCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
    }
    
}

//MARK: - UI
private extension SingletonViewController {
    
    func setupInitialUI() {
        view.backgroundColor = .blue
    }
}
