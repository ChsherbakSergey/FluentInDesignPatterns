//
//  SearchMessagePresenter.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import UIKit

protocol SearchMessagePresenterInterface: class {
    
    var messages: [Message] { get set }
    var filteredMessages: [Message] { get set }
    
    func setupDelegate(_ delegate: SearchMessageViewControllerViewDelegate)
    
    func getMessages()
    func getMessagesWithError()
    func filterMessages(with text: String)
}

final class SearchMessagePresenter: SearchMessagePresenterInterface {
    
    weak var viewDelegate: SearchMessageViewControllerViewDelegate?
    
    var messages: [Message] = [Message(text: "Hey!"),
                               Message(text: "Hi, how are you?"),
                               Message(text: "Thanks, what are you doing?"),
                               Message(text: "Whathing cartoons, and you?"),
                               Message(text: "As always"),
                               Message(text: "Learning and learning"),
                               Message(text: "Hard work pays off"),
                               Message(text: "Can't help but only agree with you here!")]
    
    var filteredMessages: [Message] = []
    
    func setupDelegate(_ delegate: SearchMessageViewControllerViewDelegate) {
        viewDelegate = delegate
    }
    
    func getMessages() {
        viewDelegate?.displayMessages(messages)
    }
    
    func getMessagesWithError() {
        viewDelegate?.failureToGetMessages()
    }
    
    func filterMessages(with text: String) {
        filteredMessages = messages.filter { $0.text.contains(text) }
        if filteredMessages.count == 0 {
            viewDelegate?.failureToFindMessages()
        } else {
            viewDelegate?.displayFilteredMessages(filteredMessages)
        }
    }
}
