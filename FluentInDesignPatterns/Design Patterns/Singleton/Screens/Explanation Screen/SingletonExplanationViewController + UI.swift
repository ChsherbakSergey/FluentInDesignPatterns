//
//  SingletonExplanationViewController + UI.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/18/21.
//

import UIKit

internal extension SingletonExplanationViewController {
    
    func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
    func makeContentView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "Singleton 📦"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        return label
    }
    
    func makeParagraphLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .medium))()
        label.numberOfLines = 0
        return label
    }
    
    func makeSubParagraphLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .tunderSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .regular))()
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 3.0, lineHeightMultiple: 1.0)
        return label
    }
    
    func makeImplementationLabel() -> UILabel {
        let label = UILabel()
        label.text = "Implementation 🚀"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        return label
    }
    
    func makeImageView(with imageName: String, height: CGFloat) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        return imageView
    }
    
    func makeUsageLabel() -> UILabel {
        let label = UILabel()
        label.text = "When should you use it? ✍🏽"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        return label
    }
    
    func makeExampleInAppLabel() -> UILabel {
        let label = UILabel()
        label.text = "Now let’s see at an example in this app 📱"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        label.numberOfLines = 2
        return label
    }
    
    func makeConclusionLabel() -> UILabel {
        let label = UILabel()
        label.text = "Conclusion 🙌🏽"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        label.numberOfLines = 2
        return label
    }
    
    func makeTwitterButton() -> UIButton {
        let button = BounceButton(type: .system)
        button.setTitle("Twitter", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.twitterSolid, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }
    
    func makeExplanationTextView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 16.0
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }
}
