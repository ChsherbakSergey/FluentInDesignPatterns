//
//  CatalogsNetworkingInterface.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

protocol CatalogsNetworkingInterface {
    
    func fetchPeopleFromSpace(with url: URL?, completion: @escaping (Result<SpaceInformationResponse, NetworkingError>) -> ())
}

