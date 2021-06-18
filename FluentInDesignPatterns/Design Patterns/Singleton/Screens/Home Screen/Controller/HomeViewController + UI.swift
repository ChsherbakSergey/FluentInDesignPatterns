//
//  HomeViewController + UI.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/18/21.
//

import UIKit

internal extension HomeViewController {
    
    func makeGreetingLabel() -> UILabel {
        let label = UILabel()
        label.alpha = 0.0
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32.0, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.numberOfLines = 1
        return label
    }
    
    func makeExplainButton() -> UIButton {
        let button = BounceButton(type: .system)
        button.alpha = 0.0
        button.setTitle("Singleton Explanation", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 12.0
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }
    
    func makeLogOutButton() -> UIButton {
        let button = BounceButton(type: .system)
        button.alpha = 0.0
        button.setTitle("Log Out", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12.0
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }
    
    func makeButtonsStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8.0
        return stackView
    }
}
