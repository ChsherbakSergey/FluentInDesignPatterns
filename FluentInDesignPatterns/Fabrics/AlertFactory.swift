//
//  AlertFactory.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/5/21.
//

import UIKit

final class AlertFactory {
    
    static func showAlertWithButton(title: String? = nil, message: String? = nil, buttonTitle: String, buttonStyle: UIAlertAction.Style, completionAction: @escaping (UIAlertAction) -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let customAction = UIAlertAction(title: buttonTitle, style: buttonStyle, handler: completionAction)
        
        alertController.addAction(cancelAction)
        alertController.addAction(customAction)
        
        return alertController
    }
}
