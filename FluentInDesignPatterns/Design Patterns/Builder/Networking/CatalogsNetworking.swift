//
//  CatalogsNetworking.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

struct CatalogsNetworking: CatalogsNetworkingInterface {
    
    private let session: URLSession = URLSession(configuration: .default)
    
    func fetchPeopleFromSpace(with url: URL?, completion: @escaping (Result<SpaceInformationResponse, NetworkingError>) -> ()) {
        guard let url = url else { return }
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.failedToFetch))
                }
                return
            }
            
            switch response.statusCode {
            
            case 200:
                do {
                    let spaceIformationResponse = try JSONDecoder().decode(SpaceInformationResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(spaceIformationResponse))
                    }
                } catch let decodeError as NSError {
                    DispatchQueue.main.async {
                        completion(.failure(.failedToFetch))
                    }
                    print("Decode error is: \(decodeError)")
                }
                
                
            default:
                break
            }
        }
        task.resume()
    }
}
