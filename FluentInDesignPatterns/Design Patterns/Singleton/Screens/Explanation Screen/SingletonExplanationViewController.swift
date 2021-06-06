//
//  SingletonExplanationViewController.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/5/21.
//

import UIKit

final class SingletonExplanationViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Singleton 📦"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        return label
    }()
    
    private lazy var firstParagraphLabel: UILabel = {
        let label = UILabel()
        label.text = SingletoneExplanation.firstParagraph
        label.textColor = .tunderSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .regular))()
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 3.0, lineHeightMultiple: 1.0)
        return label
    }()
    
    private lazy var secondParagraphLabel: UILabel = {
        let label = UILabel()
        label.text = SingletoneExplanation.secondParagraph
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .medium))()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var thirdParagraphLabel: UILabel = {
        let label = UILabel()
        label.text = SingletoneExplanation.thirdParagraph
        label.textColor = .tunderSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .regular))()
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 3.0, lineHeightMultiple: 1.0)
        return label
    }()
    
    private lazy var fourthParagraphLabel: UILabel = {
        let label = UILabel()
        label.text = SingletoneExplanation.fourthParagraph
        label.textColor = .tunderSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .regular))()
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 3.0, lineHeightMultiple: 1.0)
        return label
    }()
    
    private lazy var implementationLabel: UILabel = {
        let label = UILabel()
        label.text = "Implementation 🚀"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        return label
    }()
    
    private lazy var fifthParagraphLabel: UILabel = {
        let label = UILabel()
        label.text = SingletoneExplanation.fifthParagraph
        label.textColor = .tunderSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .regular))()
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 3.0, lineHeightMultiple: 1.0)
        return label
    }()
    
    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "\(SingletoneExplanation.firstImageName)"))
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        return imageView
    }()
    
    private lazy var usageLabel: UILabel = {
        let label = UILabel()
        label.text = "When should you use it? ✍🏽"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        return label
    }()
    
    private lazy var sixthParagraphLabel: UILabel = {
        let label = UILabel()
        label.text = SingletoneExplanation.sixthParagraph
        label.textColor = .tunderSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .regular))()
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 3.0, lineHeightMultiple: 1.0)
        return label
    }()
    
    private lazy var exmapleInAppLabel: UILabel = {
        let label = UILabel()
        label.text = "Now let’s see at an example in this app 📱"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var seventhParagraphLabel: UILabel = {
        let label = UILabel()
        label.text = SingletoneExplanation.seventhParagraph
        label.textColor = .tunderSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .regular))()
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 3.0, lineHeightMultiple: 1.0)
        return label
    }()
    
    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "\(SingletoneExplanation.secondImageName)"))
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 360.0).isActive = true
        return imageView
    }()
    
    private lazy var thirdImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "\(SingletoneExplanation.thirdImageName)"))
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 240.0).isActive = true
        return imageView
    }()
    
    private lazy var conclusionLabel: UILabel = {
        let label = UILabel()
        label.text = "Conclusion 🙌🏽"
        label.textColor = .tuataraSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 26.0, weight: .semibold))()
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var conclusionParagraphLabel: UILabel = {
        let label = UILabel()
        label.text = SingletoneExplanation.conclusionParagraph
        label.textColor = .tunderSolid
        label.font = UIFont.rounded(.systemFont(ofSize: 20.0, weight: .regular))()
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 3.0, lineHeightMultiple: 1.0)
        return label
    }()
    
    private lazy var twitterButton: UIButton = {
        let button = BounceButton(type: .system)
        button.setTitle("Twitter", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.twitterSolid, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.addTarget(self, action: #selector(handleTwitterButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var explanationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, firstParagraphLabel, secondParagraphLabel, thirdParagraphLabel, fourthParagraphLabel, implementationLabel, fifthParagraphLabel, firstImageView, usageLabel, sixthParagraphLabel, exmapleInAppLabel, seventhParagraphLabel, secondImageView, thirdImageView, conclusionLabel, conclusionParagraphLabel, twitterButton])
        stackView.axis = .vertical
        stackView.spacing = 16.0
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }()
    
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
}
