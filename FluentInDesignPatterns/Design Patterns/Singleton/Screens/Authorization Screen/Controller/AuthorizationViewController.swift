//
//  AuthorizationViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/5/21.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .quaternarySystemFill
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 16.0, weight: .medium)
        textField.placeholder = "Create your username..."
        textField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        return textField
    }()
    
    private lazy var signInButton: BounceButton = {
        let button = BounceButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 12.0
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.color = .systemGray
        return view
    }()
    
    //MARK: - Properties
    weak var coordinator: SingletonCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate
extension AuthorizationViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - User Interactions
private extension AuthorizationViewController {
    
    @objc func handleSignButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty else {
            showSnackAlert(with: "✏️", text: "Username must be set")
            return
        }
        UserDefaults.standard.setValue(true, forKey: "isSignedIn")
        UserDefaults.standard.setValue(username, forKey: "username")
        
        changeSignInButtonStateAfterTap()
        Timer.scheduledTimer(withTimeInterval: 1.50, repeats: false) { [weak self] _ in
            self?.coordinator?.pushHomeVC(username: username)
            self?.changeSignInButtonStateAfterBeignSignedIn()
            self?.usernameTextField.text = nil
        }
    }
    
    func changeSignInButtonStateAfterTap() {
        signInButton.setTitle("", for: .normal)
        signInButton.addSubview(activityIndicatorView)
        activityIndicatorView.center(inView: signInButton)
        activityIndicatorView.startAnimating()
    }
    
    func changeSignInButtonStateAfterBeignSignedIn() {
        signInButton.setTitle("Sign In", for: .normal)
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
    }
}

//MARK: - Initial UI
private extension AuthorizationViewController {
    
    func setupInitialUI() {
        view.backgroundColor = .systemBackground
        setNavigationBar()
        addViews(into: view)
        layoutViews(in: view)
        addTargets()
        setDelegates()
    }
    
    func setNavigationBar() {
        navigationItem.title = "Authorization"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addViews(into view: UIView) {
        view.addSubview(usernameTextField)
        view.addSubview(signInButton)
    }
    
    func layoutViews(in view: UIView) {
        usernameTextField.centerY(inView: view)
        usernameTextField.anchor(left: view.leftAnchor,
                                 right: view.rightAnchor,
                                 paddingLeft: 40.0,
                                 paddingRight: 40.0)
        signInButton.anchor(left: view.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.rightAnchor,
                            paddingLeft: 40.0,
                            paddingBottom: 40.0,
                            paddingRight: 40.0)
    }
    
    func addTargets() {
        signInButton.addTarget(self, action: #selector(handleSignButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setDelegates() {
        usernameTextField.delegate = self
    }
}
