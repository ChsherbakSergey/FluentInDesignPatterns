//
//  QuestionViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import UIKit

final class QuestionViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var incorrectNumberLabel: UILabel = makeNumberLabel(with: "Incorrect: 0")
    private lazy var correctNumberLabel: UILabel = makeNumberLabel(with: "Correct: 0")
    private lazy var questionLabel: UILabel = makeQuestionLabel()
    private lazy var incorrectButton: UIButton = makeAnswerButton(with: "multiply.circle", backgroundColor: .systemRed)
    private lazy var correctButton: UIButton = makeAnswerButton(with: "checkmark.circle", backgroundColor: .systemGreen)
    
    //MARK: - Properties
    weak var coordinator: StrategyCoordinator?
    private var strategy: QuestionStrategy
    
    init(strategy: QuestionStrategy) {
        self.strategy = strategy
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
        strategy.delegate = self
        setQuestionLabel(with: strategy.questions[strategy.questionIndex].title)
    }
}

//MARK: - QuestionStrategyDelegate
extension QuestionViewController: QuestionStrategyDelegate {
    
    func questionStrategyRanOutOfQuestions(_ questionStrategy: QuestionStrategy) {
        let alert = AlertFactory.showAlertWithButton(title: "🚀", message: "You made it. Congratulations!", buttonTitle: "OK", buttonStyle: .default) { [weak self] _ in
            self?.coordinator?.closeQuestionVC()
        }
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - UI
private extension QuestionViewController {
    
    func setupInitialUI() {
        view.backgroundColor = .bumbleSolid
        setupNavigationBar()
        addViews()
        layoutViews()
        addTargets()
    }
    
    func setupNavigationBar() {
        navigationItem.title = strategy.groupTitle
        setupNavigationBackButton()
    }
    
    func addViews() {
        view.addSubview(incorrectNumberLabel)
        view.addSubview(correctNumberLabel)
        view.addSubview(questionLabel)
        view.addSubview(incorrectButton)
        view.addSubview(correctButton)
    }
    
    func layoutViews() {
        incorrectNumberLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                    left: view.leftAnchor,
                                    paddingTop: 32.0,
                                    paddingLeft: 40.0)
        correctNumberLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                  right: view.rightAnchor,
                                  paddingTop: 32.0,
                                  paddingRight: 40.0)
        questionLabel.centerY(inView: view)
        questionLabel.anchor(left: view.leftAnchor,
                             right: view.rightAnchor,
                             paddingLeft: 40.0,
                             paddingRight: 40.0)
        incorrectButton.anchor(left: view.leftAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               paddingLeft: 40.0,
                               paddingBottom: 32.0)
        correctButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                             right: view.rightAnchor,
                             paddingBottom: 32.0,
                             paddingRight: 40.0)
    }
    
    func addTargets() {
        incorrectButton.addTarget(self, action: #selector(handleIncorrectButtonTapped(_:)), for: .touchUpInside)
        correctButton.addTarget(self, action: #selector(handleCorrectButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func handleIncorrectButtonTapped(_ sender: UIButton) {
        strategy.questions[strategy.questionIndex].isTruth ? markAsIncorrect() : markAsCorrect()
        setQuestionLabel(with: strategy.questions[strategy.questionIndex].title)
    }
    
    @objc func handleCorrectButtonTapped(_ sender: UIButton) {
        strategy.questions[strategy.questionIndex].isTruth ? markAsCorrect() : markAsIncorrect()
        setQuestionLabel(with: strategy.questions[strategy.questionIndex].title)
    }
    
    func markAsIncorrect() {
        strategy.markAsIncorrect()
        incorrectNumberLabel.text = "Incorrect: \(strategy.numberOfIncorrectAnswers)"
    }
    
    func markAsCorrect() {
        strategy.markAsCorrect()
        correctNumberLabel.text = "Correct: \(strategy.numberOfCorrectAnswers)"
    }
    
    func setQuestionLabel(with text: String) {
        questionLabel.text = text
    }
}
