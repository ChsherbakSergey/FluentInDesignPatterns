//
//  CatalogsViewControllerDataSource.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import UIKit

final class CatalogsViewControllerDataSource: NSObject, UITableViewDataSource {
    
    private var peopleRepresentable: [People]
    
    //MARK: - Init
    init(tableView: UITableView, peopleRepresentable: [People] = []) {
        self.peopleRepresentable = peopleRepresentable
        super.init()
        tableView.dataSource = self
    }
    
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleRepresentable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = peopleRepresentable[indexPath.row].name
        return cell
    }
}
