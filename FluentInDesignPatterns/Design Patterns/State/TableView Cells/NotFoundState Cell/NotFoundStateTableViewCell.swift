//
//  NotFoundStateTableViewCell.swift
//  FluentInDesignPatterns
//
//  Created by Sergey Chsherbak on 6/9/21.
//

import UIKit

final class NotFoundStateTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "NotFoundStateTableViewCell"
    
    //MARK: - UI Elements
    private let notFoundLabel: UILabel = {
        let label = UILabel()
        label.text = "Could not find anything. Try again!"
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
private extension NotFoundStateTableViewCell {
    
    func setInitialUI() {
        selectionStyle = .none
        addViews(into: contentView)
        layoutView(in: contentView)
    }
    
    func addViews(into view: UIView) {
        view.addSubview(notFoundLabel)
    }
    
    func layoutView(in view: UIView) {
        notFoundLabel.centerY(inView: view)
        notFoundLabel.anchor(left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingLeft: 32.0,
                          paddingRight: 32.0)
    }
}

