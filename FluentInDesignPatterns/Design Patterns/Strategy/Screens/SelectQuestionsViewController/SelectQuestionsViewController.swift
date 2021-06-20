//
//  SelectQuestionsViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/19/21.
//

import UIKit

final class SelectQuestionsViewController: UIViewController {
    
    weak var coordinator: StrategyCoordinator?
    
    private lazy var easyQuestionsButton: UIButton = makeQuestionGroupButton(with: "Easy", backgrounColor: .systemGreen)
    private lazy var mediumQuestionsButton: UIButton = makeQuestionGroupButton(with: "Medium", backgrounColor: .systemOrange)
    private lazy var hardQuestionsButton: UIButton = makeQuestionGroupButton(with: "Hard", backgrounColor: .systemRed)
    
    private lazy var questionButtonsStackView: UIStackView = makeQuestionStackView(arrangedSubviews: [easyQuestionsButton, mediumQuestionsButton, hardQuestionsButton])
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
    }
}

//MARK: - UI
private extension SelectQuestionsViewController {
    
    func setInitialUI() {
        view.backgroundColor = .bumbleSolid
        setNavigationBar()
        addTargets()
        addViews(into: view)
        layoutViews(in: view)
    }
    
    func setNavigationBar() {
        navigationItem.title = "Question groups ✏️"
    }
    
    func addViews(into view: UIView) {
        view.addSubview(questionButtonsStackView)
    }
    
    func layoutViews(in view: UIView) {
        questionButtonsStackView.centerY(inView: view)
        questionButtonsStackView.anchor(left: view.leftAnchor,
                                        right: view.rightAnchor,
                                        paddingLeft: 40.0,
                                        paddingRight: 40.0)
    }
    
    func addTargets() {
        easyQuestionsButton.addTarget(self, action: #selector(handleQuestionsButtonTapped(_:)), for: .touchUpInside)
        mediumQuestionsButton.addTarget(self, action: #selector(handleQuestionsButtonTapped(_:)), for: .touchUpInside)
        hardQuestionsButton.addTarget(self, action: #selector(handleQuestionsButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func handleQuestionsButtonTapped(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Easy":
            coordinator?.openQuestionVC(strategy: EasyQuestionStrategy())
            
        case "Medium":
            coordinator?.openQuestionVC(strategy: MediumQuestionStrategy())
            
        case "Hard":
            coordinator?.openQuestionVC(strategy: HardQuestionStrategy())
            
        default:
            break
        }
    }
}
