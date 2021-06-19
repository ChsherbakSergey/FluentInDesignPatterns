//
//  SelectQuestionsViewController + UI.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import UIKit

internal extension SelectQuestionsViewController {
    
    func makeQuestionGroupButton(with title: String, backgrounColor: UIColor) -> UIButton {
        let button = BounceButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = backgrounColor
        button.layer.cornerRadius = 12.0
        button.layer.borderWidth = 0.75
        button.layer.borderColor = UIColor.black.cgColor
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }
    
    func makeQuestionStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 8.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }
}
