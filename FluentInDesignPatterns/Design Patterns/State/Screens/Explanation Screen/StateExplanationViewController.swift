//
//  StateExplanationViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/10/21.
//

import UIKit

final class StateExplanationViewController: UIViewController {
    
    //MARK: - UI Elements
    
    //MARK: - Properties
    weak var coordinator: StateCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
    }
}

//MARK: - StateExplanationViewController
private extension StateExplanationViewController {
    
    func setInitialUI() {
        view.backgroundColor = .systemBackground
    }
}
