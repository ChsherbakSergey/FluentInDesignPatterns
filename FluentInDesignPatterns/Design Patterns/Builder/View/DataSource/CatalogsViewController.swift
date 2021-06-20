//
//  CatalogsViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import UIKit

final class CatalogsViewController: UIViewController {

    //MARK: - UI Elements
    lazy var tableView: UITableView = makeTableView()
    
    //MARK: - Properties
    weak var coordinator: BuilderCoordinator?
    private let interactor: CatalogsInteractorInterface
    var dataSource: CatalogsViewControllerDataSource?
    
    //MARK: - Init(-s)
    init(interactor: CatalogsInteractorInterface) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
        tableView.dataSource = dataSource
        interactor.fetchPeople()
    }
    
    //MARK: - Public Methods
    internal func setTableView(with peopleInSpace: [People]) {
        dataSource = CatalogsViewControllerDataSource(tableView: tableView, peopleRepresentable: peopleInSpace)
        tableView.reloadData()
    }
}
