//
//  CatalogsInteractor.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

final class CatalogsInteractor: CatalogsInteractorInterface {
    
    private let presenter: CatalogsPresenterInterface
    private let networking: CatalogsNetworkingInterface
    
    init(presenter: CatalogsPresenterInterface, networking: CatalogsNetworkingInterface) {
        self.presenter = presenter
        self.networking = networking
    }
    
    func fetchPeople() {
        networking.fetchPeopleFromSpace(with: URLConstants.peopleInSpaceURL) { [weak self] result in
            switch result {
            
            case .success(let response):
                self?.presenter.filterPeopleAlphabetically(with: response)
                
            case .failure(let error):
                self?.presenter.showError(error)
            }
        }
    }
}

