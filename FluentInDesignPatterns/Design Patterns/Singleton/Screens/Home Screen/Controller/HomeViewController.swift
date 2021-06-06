//
//  HomeViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/5/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.0
        label.text = "Hello, \(username) 👋🏽"
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32.0, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var explainButton: BounceButton = {
        let button = BounceButton(type: .system)
        button.alpha = 0.0
        button.setTitle("Singleton Explanation", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 12.0
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }()
    
    private lazy var logOutButton: BounceButton = {
        let button = BounceButton(type: .system)
        button.alpha = 0.0
        button.setTitle("Log Out", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12.0
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [explainButton, logOutButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8.0
        return stackView
    }()
    
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
}
