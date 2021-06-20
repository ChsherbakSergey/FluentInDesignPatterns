//
//  CatalogsViewController + UI.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import UIKit

internal extension CatalogsViewController {
    
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
        return tableView
    }
    
    func setupInitialUI() {
        view.backgroundColor = .systemPurple
    }
}

