//
//  SingletonExplanationViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/5/21.
//

import UIKit

final class SingletonExplanationViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var scrollView: UIScrollView = makeScrollView()
    private lazy var contentView: UIView = makeContentView()
    
    private lazy var titleLabel: UILabel = makeTitleLabel()
    private lazy var firstParagraphLabel: UILabel = makeSubParagraphLabel(with: SingletoneExplanation.firstParagraph)
    private lazy var secondParagraphLabel: UILabel = makeParagraphLabel(with: SingletoneExplanation.secondParagraph)
    private lazy var thirdParagraphLabel: UILabel = makeSubParagraphLabel(with: SingletoneExplanation.thirdParagraph)
    private lazy var fourthParagraphLabel: UILabel = makeSubParagraphLabel(with: SingletoneExplanation.fourthParagraph)
    
    private lazy var implementationLabel: UILabel = makeImplementationLabel()
    private lazy var fifthParagraphLabel: UILabel = makeSubParagraphLabel(with: SingletoneExplanation.fifthParagraph)
    private lazy var firstImageView: UIImageView = makeImageView(with: SingletoneExplanation.firstImageName, height: 120.0)
    
    private lazy var usageLabel: UILabel = makeUsageLabel()
    private lazy var sixthParagraphLabel: UILabel = makeSubParagraphLabel(with: SingletoneExplanation.sixthParagraph)
    
    private lazy var exampleInAppLabel: UILabel = makeExampleInAppLabel()
    private lazy var seventhParagraphLabel: UILabel = makeSubParagraphLabel(with: SingletoneExplanation.seventhParagraph)
    private lazy var secondImageView: UIImageView = makeImageView(with: SingletoneExplanation.secondImageName, height: 360.0)
    private lazy var thirdImageView: UIImageView = makeImageView(with: SingletoneExplanation.thirdImageName, height: 240.0)
    
    private lazy var conclusionLabel: UILabel = makeConclusionLabel()
    private lazy var conclusionParagraphLabel: UILabel = makeSubParagraphLabel(with:  SingletoneExplanation.conclusionParagraph)
    private lazy var twitterButton: UIButton = makeTwitterButton()
    
    private lazy var explanationStackView: UIStackView = makeExplanationTextView(arrangedSubviews: [titleLabel, firstParagraphLabel, secondParagraphLabel, thirdParagraphLabel, fourthParagraphLabel, implementationLabel, fifthParagraphLabel, firstImageView, usageLabel, sixthParagraphLabel, exampleInAppLabel, seventhParagraphLabel, secondImageView, thirdImageView, conclusionLabel, conclusionParagraphLabel, twitterButton])
    
    //MARK: - Properties
    weak var coordinator: SingletonCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
    }
}

//MARK: - User Interactions
private extension SingletonExplanationViewController {
    
    @objc func handleTwitterButtonTapped(_ sender: UIButton) {
        let url = URL(string: URLConstants.twitterURL)
        coordinator?.presentTwitterVC(with: url)
    }
}

//MARK: - Initial UI
private extension SingletonExplanationViewController {
    
    func setInitialUI() {
        view.backgroundColor = .systemBackground
        setNavigationBar()
        addViews(into: view)
        layoutViews(in: view)
        addTargets()
    }
    
    func setNavigationBar() {
        navigationItem.title = "Explanation 👨🏽‍💻"
        setupNavigationBackButton()
    }
    
    func setupNavigationBackButton() {
        let backButton = UIBarButtonItem()
        backButton.tintColor = .label
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func addViews(into view: UIView) {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(explanationStackView)
    }
    
    func layoutViews(in view: UIView) {
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          bottom: view.bottomAnchor,
                          right: view.rightAnchor)
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.anchor(top: scrollView.topAnchor,
                                    left: scrollView.leftAnchor,
                                    bottom: scrollView.bottomAnchor,
                                    right: scrollView.rightAnchor)
        
        explanationStackView.anchor(top: contentView.topAnchor,
                                    left: contentView.leftAnchor,
                                    bottom: contentView.bottomAnchor,
                                    right: contentView.rightAnchor,
                                    paddingTop: 16.0,
                                    paddingLeft: 16.0,
                                    paddingBottom: 16.0,
                                    paddingRight: 16.0)
    }
    
    func addTargets() {
        twitterButton.addTarget(self, action: #selector(handleTwitterButtonTapped(_:)), for: .touchUpInside)
    }
}
