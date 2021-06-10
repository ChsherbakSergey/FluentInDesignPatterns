//
//  SearchMessageViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import UIKit

protocol SearchMessageViewControllerViewDelegate: class {
    
    func displayMessages(_ messages: [Message])
    func displayFilteredMessages(_ messages: [Message])
    func failureToFindMessages()
    func failureToGetMessages()
}

final class SearchMessageViewController: UIViewController {
    
    //MARK: - UIElements
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InitialStateTableViewCell.self, forCellReuseIdentifier: InitialStateTableViewCell.reuseIdentifier)
        tableView.register(LoadingStateTableViewCell.self, forCellReuseIdentifier: LoadingStateTableViewCell.reuseIdentifier)
        tableView.register(ErrorStateTableViewCell.self, forCellReuseIdentifier: ErrorStateTableViewCell.reuseIdentifier)
        tableView.register(NotFoundStateTableViewCell.self, forCellReuseIdentifier: NotFoundStateTableViewCell.reuseIdentifier)
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var searchController: UISearchController = UISearchController()
    
    //MARK: - Properties
    weak var coordinator: StateCoordinator?
    private let presenter: SearchMessagePresenterInterface = SearchMessagePresenter()
    
    var state: State?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        state = State.transitionToState(.initial, viewController: self)
        presenter.setupDelegate(self)
        setInitialUI()
    }
}

//MARK: - SearchMessageViewControllerViewDelegate
extension SearchMessageViewController: SearchMessageViewControllerViewDelegate {
    
    func displayMessages(_ messages: [Message]) {
        state = State.transitionToState(.showingData(messages), viewController: self)
        state?.enter()
    }
    
    func displayFilteredMessages(_ messages: [Message]) {
        state = State.transitionToState(.showingData(messages), viewController: self)
        state?.enter()
    }
    
    func failureToFindMessages() {
        state = State.transitionToState(.notFound, viewController: self)
        state?.enter()
    }
    
    func failureToGetMessages() {
        state = State.transitionToState(.error, viewController: self)
        state?.enter()
    }
}

//MARK: - UITableViewDelegate
extension SearchMessageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        state?.tableView(tableView, heightForRowAt: indexPath) ?? 0.0
    }
}

//MARK: - UISearchBarDelegate
extension SearchMessageViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchBar.text != "" else {
            state = State.transitionToState(.showingData(presenter.messages), viewController: self)
            state?.enter()
            return
        }
        state = State.transitionToState(.loading, viewController: self)
        state?.enter()
        Timer.scheduledTimer(withTimeInterval: 1.00, repeats: false) { [weak self] _ in
            self?.presenter.filterMessages(with: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        state = State.transitionToState(.showingData(presenter.messages), viewController: self)
        state?.enter()
    }
}

//MARK: - User Interactions
private extension SearchMessageViewController {
    
    @objc func handleDisplayAllMessagesButtonTapped(_ sender: UIBarButtonItem) {
        state = State.transitionToState(.loading, viewController: self)
        state?.enter()
        Timer.scheduledTimer(withTimeInterval: 1.50, repeats: false) { [weak self] _ in
            self?.presenter.getMessages()
        }
    }
    
    @objc func handleErrorButtonTapped(_ sender: UIBarButtonItem) {
        state = State.transitionToState(.loading, viewController: self)
        state?.enter()
        Timer.scheduledTimer(withTimeInterval: 1.50, repeats: false) { [weak self] _ in
            self?.presenter.getMessagesWithError()
        }
    }
}

//MARK: - SearchMessageViewController
private extension SearchMessageViewController {
    
    func setInitialUI() {
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        addViews(into: view)
        layoutViews(in: view)
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Chat"
        setupRightNavigationButton()
        setupLeftNavigationButton()
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    func setupRightNavigationButton() {
        let displayButton = UIBarButtonItem(title: "All messages", style: .done, target: self, action: #selector(handleDisplayAllMessagesButtonTapped(_:)))
        displayButton.tintColor = .label
        navigationItem.rightBarButtonItem = displayButton
    }
    
    func setupLeftNavigationButton() {
        let errorButton = UIBarButtonItem(title: "Error", style: .done, target: self, action: #selector(handleErrorButtonTapped(_:)))
        errorButton.tintColor = .label
        navigationItem.leftBarButtonItem = errorButton
    }
    
    func addViews(into view: UIView) {
        view.addSubview(tableView)
    }
    
    func layoutViews(in view: UIView) {
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor)
    }
}
