//
//  AuthManager.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/6/21.
//

import Foundation

final class AuthManager {
    
    static let shared: AuthManager = AuthManager()
    
    private init() { }
    
    var isSignedIn: Bool {
        guard let isSignedIn = UserDefaults.standard.value(forKey: "isSignedIn") as? Bool else { return false }
        return isSignedIn
    }
    
    var username: String? {
        guard let username = UserDefaults.standard.value(forKey: "username") as? String else { return nil }
        return username
    }
}
