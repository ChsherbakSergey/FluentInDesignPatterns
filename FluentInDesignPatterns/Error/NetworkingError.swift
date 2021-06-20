//
//  NetworkingError.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/20/21.
//

import Foundation

enum NetworkingError: String, Error {
    
    case failedToFetch = "Failed to fetch data from a server"
    
    case invalidURL = "Provided invalid URL"
}
