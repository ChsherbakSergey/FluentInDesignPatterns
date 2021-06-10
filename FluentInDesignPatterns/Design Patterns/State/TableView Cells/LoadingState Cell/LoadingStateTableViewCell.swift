//
//  LoadingTableViewCell.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import UIKit

final class LoadingStateTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "LoadingStateTableViewCell"
    
    //MARK: - UI Elements
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        return activityIndicatorView
    }()
    
    //MARK: - Init(-s)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setInitialUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI
private extension LoadingStateTableViewCell {
    
    func setInitialUI() {
        selectionStyle = .none
        addViews(into: contentView)
        layoutViews(in: contentView)
    }
    
    func addViews(into view: UIView) {
        view.addSubview(activityIndicatorView)
    }
    
    func layoutViews(in view: UIView) {
        activityIndicatorView.center(inView: view)
    }
}
