//
//  SearchMessageViewController + State.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import UIKit

extension SearchMessageViewController {
    
    class State: NSObject, UITableViewDataSource {
        
        enum Kind {
            
            case initial
            
            case loading
            
            case showingData([Message])
            
            case notFound
            
            case error
        }
        
        static internal func transitionToState(_ state: Kind, viewController: SearchMessageViewController) -> State {
            switch state {
            
            case .initial:
                return InitialState(viewController: viewController)
                
            case .loading:
                return LoadingState(viewController: viewController)
                
            case .showingData(let messages):
                return ShowingData(viewController: viewController, messages: messages)
                
            case .notFound:
                return notFoundState(viewController: viewController)
                
            case .error:
                return ErrorState(viewController: viewController)
            }
        }
        
        weak var viewController: SearchMessageViewController!
        
        //MARK: - Cell Configurators
        private let messageCellConfigurator: MessageTableViewCellConfigurator<Message> = .init(messageKeyPath: \.text)
        
        init(viewController: SearchMessageViewController) {
            self.viewController = viewController
            super.init()
            viewController.tableView.dataSource = self
        }
        
        internal func enter() {
            viewController.tableView.reloadData()
        }
        
        //MARK: - UITableViewDataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch viewController.state {
            case is ShowingData:
                guard let showingData = viewController.state as? ShowingData else { return 1 }
                return showingData.getAllMessages().count
                
            default:
                return 1
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch viewController.state {
            
            case is InitialState:
                return tableView.dequeueReusableCell(withIdentifier: InitialStateTableViewCell.reuseIdentifier, for: indexPath) as! InitialStateTableViewCell
                
            case is LoadingState:
                let cell = tableView.dequeueReusableCell(withIdentifier: LoadingStateTableViewCell.reuseIdentifier, for: indexPath) as! LoadingStateTableViewCell
                cell.activityIndicatorView.startAnimating()
                return cell
                
            case is ErrorState:
                return tableView.dequeueReusableCell(withIdentifier: ErrorStateTableViewCell.reuseIdentifier, for: indexPath) as! ErrorStateTableViewCell
                
            case is notFoundState:
                return tableView.dequeueReusableCell(withIdentifier: NotFoundStateTableViewCell.reuseIdentifier, for: indexPath) as! NotFoundStateTableViewCell
                
            case is ShowingData:
                guard let showingData = viewController.state as? ShowingData else { return .init() }
                
                let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.reuseIdentifier, for: indexPath) as! MessageTableViewCell
                let messages = showingData.getAllMessages()
                messageCellConfigurator.configure(for: cell, model: messages[indexPath.row])
                return cell
                
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: LoadingStateTableViewCell.reuseIdentifier, for: indexPath) as! LoadingStateTableViewCell
                cell.activityIndicatorView.startAnimating()
                return cell
            }
        }
        
        //MARK: - UITableViewDelegate
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch viewController.state {
            
            case is ShowingData:
                return 60.0
                
            default:
                return 366.0 //That's exactly how many days a year you have to work to achieve things you desire :)
            }
        }
    }
}

extension SearchMessageViewController {
    
    final class InitialState: State {}
    
    final class LoadingState: State {}
    
    final class notFoundState: State {}
    
    final class ErrorState: State {}
    
    final class ShowingData: State {
        
        private var messages: [Message] = []
            
        override init(viewController: SearchMessageViewController) {
            super.init(viewController: viewController)
        }
        
        init(viewController: SearchMessageViewController, messages: [Message]) {
            super.init(viewController: viewController)
            self.messages = messages
        }
        
        internal func getAllMessages() -> [Message] {
            return messages
        }
    }
    
}
