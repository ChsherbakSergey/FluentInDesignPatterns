//
//  CatalogsPresenterInterface.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

protocol CatalogsPresenterInterface {
    
    var viewController: CatalogsViewController? { get set }
    
    var peopleInSpace: [People] { get set }
    
    func filterPeopleAlphabetically(with response: SpaceInformationResponse)
    
    func showError(_ error: Error)
}
