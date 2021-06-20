//
//  CatalogsInteractorInterface.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

protocol CatalogsInteractorInterface {
     
    init(presenter: CatalogsPresenterInterface, networking: CatalogsNetworkingInterface)
    
    func fetchPeople()
}
