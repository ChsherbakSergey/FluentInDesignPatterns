//
//  AuthorizationViewController + UI.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/18/21.
//

import UIKit

internal extension AuthorizationViewController {
    
    func makeUsernameTextField() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .quaternarySystemFill
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 16.0, weight: .medium)
        textField.placeholder = "Create your username..."
        textField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        return textField
    }
    
    func makeSignInButton() -> UIButton {
        let button = BounceButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 12.0
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }
    
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .medium)
        view.color = .systemGray
        return view
    }
}
