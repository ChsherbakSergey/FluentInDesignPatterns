//
//  People.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

struct People: Decodable {
    let name: String
    let craft: String
    
    private enum CodingKeys: String, CodingKey {
        
        case name
        
        case craft
    }
}

extension People {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        try self.init(name: container.decode(String.self, forKey: .name),
                      craft: container.decode(String.self, forKey: .craft))
    }
}

extension People: Equatable {
    
    static func == (lhs: People, rhs: People) -> Bool {
        return lhs.name == rhs.name
            && lhs.craft == rhs.craft
        
    }
}

