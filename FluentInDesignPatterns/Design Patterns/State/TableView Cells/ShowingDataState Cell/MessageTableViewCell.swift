//
//  MessageTableViewCell.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import UIKit

final class MessageTableViewCell: UITableViewCell, MessageTableViewCellInterface {
    
    static let reuseIdentifier: String = "MessageTableViewCell"
    
    //MARK: - UI Elements
    internal lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.rounded(.systemFont(ofSize: 18.0, weight: .medium))()
        label.textAlignment = .left
        return label
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
private extension MessageTableViewCell {
    
    func setInitialUI() {
        selectionStyle = .none
        addViews(into: contentView)
        layoutViews(in: contentView)
    }
    
    func addViews(into view: UIView) {
        view.addSubview(messageLabel)
    }
    
    func layoutViews(in view: UIView) {
        messageLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
                            paddingTop: 12.0, paddingLeft: 16.0, paddingBottom: 12.0, paddingRight: 16.0)
    }
}
