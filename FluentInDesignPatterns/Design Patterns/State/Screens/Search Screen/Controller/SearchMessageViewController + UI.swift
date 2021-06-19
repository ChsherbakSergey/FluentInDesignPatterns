//
//  SearchMessageViewController + UI.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/19/21.
//

import UIKit

internal extension SearchMessageViewController {
    
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.register(InitialStateTableViewCell.self, forCellReuseIdentifier: InitialStateTableViewCell.reuseIdentifier)
        tableView.register(LoadingStateTableViewCell.self, forCellReuseIdentifier: LoadingStateTableViewCell.reuseIdentifier)
        tableView.register(ErrorStateTableViewCell.self, forCellReuseIdentifier: ErrorStateTableViewCell.reuseIdentifier)
        tableView.register(NotFoundStateTableViewCell.self, forCellReuseIdentifier: NotFoundStateTableViewCell.reuseIdentifier)
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        return tableView
    }
    
    func makeExplanationButton() -> UIButton {
        let button = BounceButton(type: .system)
        button.setImage(UIImage(systemName: "questionmark"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .twitterSolid
        button.setDimensions(width: 50.0, height: 50.0)
        button.layer.cornerRadius = 25.0
        return button
    }
}
