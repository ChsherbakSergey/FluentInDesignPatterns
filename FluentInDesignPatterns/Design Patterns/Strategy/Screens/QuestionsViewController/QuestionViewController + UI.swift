//
//  QuestionViewController + UI.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import UIKit

internal extension QuestionViewController {
    
    func makeQuestionLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        label.numberOfLines = 8
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }
    
    func makeNumberLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        label.numberOfLines = 1
        return label
    }
    
    func makeAnswerButton(with imageName: String, backgroundColor: UIColor) -> UIButton {
        let button = BounceButton(type: .system)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.tintColor = .white
        button.backgroundColor = backgroundColor
        button.setDimensions(width: 50.0, height: 50.0)
        button.layer.cornerRadius = 25.0
        button.layer.borderWidth = 0.75
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }
    
    func setupNavigationBackButton() {
        let backButton = UIBarButtonItem()
        backButton.tintColor = .label
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
