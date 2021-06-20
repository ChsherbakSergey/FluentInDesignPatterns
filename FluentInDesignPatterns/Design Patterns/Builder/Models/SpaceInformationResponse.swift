//
//  SpaceInformationResponse.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

struct SpaceInformationResponse: Decodable {
    var people: [People]
    let number: Int
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        
        case people
        
        case number
        
        case message
    }
}

extension SpaceInformationResponse {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        try self.init(people: container.decode([People].self, forKey: .people),
                      number: container.decode(Int.self, forKey: .number),
                      message: container.decode(String.self, forKey: .message))
    }
}
