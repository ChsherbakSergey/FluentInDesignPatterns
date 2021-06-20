//
//  CatalogsPresenter.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

final class CatalogsPresenter: CatalogsPresenterInterface {

    weak var viewController: CatalogsViewController?
    
    var peopleInSpace: [People] = []
    
    func filterPeopleAlphabetically(with response: SpaceInformationResponse) {
        peopleInSpace = response.people
        peopleInSpace.sort(by: { $0.name < $1.name })
        viewController?.setTableView(with: peopleInSpace)
    }
    
    func showError(_ error: Error) {
        
    }
}

