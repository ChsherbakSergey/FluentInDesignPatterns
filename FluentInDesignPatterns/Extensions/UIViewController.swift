//
//  UIViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/5/21.
//

import UIKit

extension UIViewController {
    
    func showSnackAlert(with emoji: String? = nil, text: String? = nil) {
        
        let snackView = UIView()
        snackView.alpha = 0.0
        snackView.backgroundColor = UIColor.label.withAlphaComponent(0.95)
        snackView.layer.cornerRadius = 20.0
        snackView.setDimensions(width: 160.0, height: 160.0)
        
        let emojiLabel = UILabel()
        emojiLabel.text = emoji
        emojiLabel.textAlignment = .center
        emojiLabel.font = .systemFont(ofSize: 60.0)
        emojiLabel.numberOfLines = 1
        emojiLabel.adjustsFontSizeToFitWidth = true
        emojiLabel.minimumScaleFactor = 0.75
        emojiLabel.setDimensions(width: 64.0, height: 58.0)
        
        let titleLabel = UILabel()
        titleLabel.text = text
        titleLabel.textColor = .systemBackground
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 20.0, weight: .semibold)
        titleLabel.numberOfLines = 2
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.75
        
        view.addSubview(snackView)
        snackView.addSubview(emojiLabel)
        snackView.addSubview(titleLabel)
        
        snackView.center(inView: view)
        
        emojiLabel.centerX(inView: snackView)
        emojiLabel.anchor(top: snackView.topAnchor, paddingTop: 30.0)
        
        titleLabel.centerX(inView: snackView)
        titleLabel.anchor(top: emojiLabel.bottomAnchor, left: snackView.leftAnchor, bottom: snackView.bottomAnchor, right: snackView.rightAnchor,
                          paddingTop: 10.0, paddingLeft: 12.0, paddingBottom: 20.0, paddingRight: 12.0)
        
        UIView.animate(withDuration: 0.25) {
            snackView.alpha = 1
        } completion: { (_) in
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                UIView.animate(withDuration: 0.7) {
                    snackView.alpha = 0
                } completion: { (isCompleted) in
                    if isCompleted {
                        snackView.removeFromSuperview()
                    }
                }
            }
        }
    }
}

