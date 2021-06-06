//
//  SingletoneExplanation.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/6/21.
//

import Foundation

struct SingletoneExplanation {
    
    //MARK: - Text
    static let firstParagraph: String = "Singleton is a creational design pattern which ensures that an application has only a single instance of a class and provides global access to it."
    
    static let secondParagraph: String = "Singleton helps to solve two problems:"
    
    static let thirdParagraph: String = """
    1. Control access to some shared resources (for example settings or some file);
    2. Access some object from any part of the program.
    """
    
    static let fourthParagraph: String = "But while Singleton solves these two problems it also violates the Single Responsibility Principle and make it difficult to write the unit tests because of it."
    
    static let fifthParagraph: String = "To implement the Singleton pattern you need to create a static property that acts as a constructor creates an object and saves it in the static field. Now all of the calls to this field will return the same object."
    
    static let sixthParagraph: String = """
    1. Use it when a class in your program should have only one instance that will be available from anywhere in the code.
    2. Use it when you need stricter control over the global variables. Unlike global variables, the Singleton pattern guarantees that there’s just one instance of a class. Nothing, except for the Singleton class itself, can replace the cached instance.
    """
    
    static let seventhParagraph: String = """
    Here we use the Singleton pattern to create an AuthManager. Every time we sign in or log out we store a value in a “isSignedIn” variable using UserDefaults. Note that UserDefaults class also the Singleton. So, when we open the app it goes to this source of truth and asks it what value it has. Based on what we get back (either true or false) application opens an Authorization screen or Home screen. We also store username in the Singleton class. So later you can access it in any part of the app or change it if you need it.
    """
    
    static let conclusionParagraph: String = """
    I hope you liked this explanation 🙃.
    If you have any questions or ideas don't hesitate to contact me.
    """
    
    //MARK: - Images
    static let firstImageName: String = "singletone-implementation"
    
    static let secondImageName: String = "singleton-authManager"
    
    static let thirdImageName: String = "singleton-opensRightScreen"
}
