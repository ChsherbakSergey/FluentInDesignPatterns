//
//  ErrorStateTableViewCell.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import UIKit

final class ErrorStateTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "ErrorStateTableViewCell"
    
    //MARK: - UI Elements
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Error. Something went wrong."
        label.textColor = .label
        label.font = UIFont.rounded(.systemFont(ofSize: 16.0, weight: .medium))()
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setInitialUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI
private extension ErrorStateTableViewCell {
    
    func setInitialUI() {
        selectionStyle = .none
        addViews(into: contentView)
        layoutView(in: contentView)
    }
    
    func addViews(into view: UIView) {
        view.addSubview(errorLabel)
    }
    
    func layoutView(in view: UIView) {
        errorLabel.centerY(inView: view)
        errorLabel.anchor(left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingLeft: 32.0,
                          paddingRight: 32.0)
    }
}
