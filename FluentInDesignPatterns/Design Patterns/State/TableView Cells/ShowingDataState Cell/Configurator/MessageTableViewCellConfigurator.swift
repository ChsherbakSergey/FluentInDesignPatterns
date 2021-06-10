//
//  MessageTableViewCellConfigurator.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import Foundation

struct MessageTableViewCellConfigurator<Model> {
    
    let messageKeyPath: KeyPath<Model, String>
    
    func configure(for cell: MessageTableViewCellInterface, model: Model) {
        cell.messageLabel.text = model[keyPath: messageKeyPath]
    }
}
