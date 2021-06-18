//
//  HomeViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/5/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var greetingLabel: UILabel = makeGreetingLabel()
    private lazy var explainButton: UIButton = makeExplainButton()
    private lazy var logOutButton: UIButton = makeLogOutButton()
    private lazy var buttonsStackView: UIStackView = makeButtonsStackView(arrangedSubviews: [explainButton, logOutButton])
    
    //MARK: - Properties
    weak var coordinator: SingletonCoordinator?
    
    private let username: String
    
    //MARK: - Init(-s)
    init(username: String) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate(greetingLabel)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.animate(self.explainButton)
        }
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.animate(self.logOutButton)
        }
    }
}

//MARK: - User Interactions
private extension HomeViewController {
    
    @objc func handleExplainButtonTapped(_ sender: UIButton) {
        coordinator?.pushExplanationVC()
    }
    
    @objc func handleLogOutButtonTapped(_ sender: UIButton) {
        let alert = AlertFactory.showAlertWithButton(title: "Are you sure you want to log out?", buttonTitle: "Yes", buttonStyle: .destructive) { [weak self] (_) in
            UserDefaults.standard.setValue(false, forKey: "isSignedIn")
            self?.coordinator?.start()
        }
        present(alert, animated: true)
    }
}

//MARK: - Initial UI
private extension HomeViewController {
    
    func setInitialUI() {
        view.backgroundColor = .systemBackground
        addViews(into: view)
        layoutViews(in: view)
        addTargets()
        setNavigationBar()
        setGreetingLabel(with: "Hello, \(username) 👋🏽")
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addViews(into view: UIView) {
        view.addSubview(greetingLabel)
        view.addSubview(buttonsStackView)
    }
    
    func layoutViews(in view: UIView) {
        greetingLabel.center(inView: view)
        buttonsStackView.anchor(left: view.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.rightAnchor,
                            paddingLeft: 40.0,
                            paddingBottom: 40.0,
                            paddingRight: 40.0)
    }
    
    func addTargets() {
        explainButton.addTarget(self, action: #selector(handleExplainButtonTapped(_:)), for: .touchUpInside)
        logOutButton.addTarget(self, action: #selector(handleLogOutButtonTapped(_:)), for: .touchUpInside)
    }
    
    func animate(_ view: UIView) {
        UIView.animate(withDuration: 1.0) { view.alpha = 1.0 }
    }
    
    func setGreetingLabel(with text: String) {
        greetingLabel.text = text
    }
}
