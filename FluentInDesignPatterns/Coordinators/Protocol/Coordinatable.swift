//
//  Coordinatable.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/5/21.
//

import UIKit

protocol Coordinatable {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
