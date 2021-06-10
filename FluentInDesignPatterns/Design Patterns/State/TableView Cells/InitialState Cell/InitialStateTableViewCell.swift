//
//  InitialStateTableViewCell.swift
//  FluentInDesignPatterns
//
//  Created by Sergey on 6/9/21.
//

import UIKit

final class InitialStateTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "InitialStateTableViewCell"
    
    //MARK: - UI Elements
    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.text = "Search for a new message.."
        label.textColor = .label
        label.font = UIFont.rounded(.systemFont(ofSize: 16.0, weight: .semibold))()
        label.textAlignment = .center
        label.numberOfLines = 0
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
private extension InitialStateTableViewCell {
        
    func setInitialUI() {
        selectionStyle = .none
        addViews(into: contentView)
        layoutViews(in: contentView)
    }
    
    func addViews(into view: UIView) {
        view.addSubview(tipLabel)
    }
    
    func layoutViews(in view: UIView) {
        tipLabel.centerY(inView: view)
        tipLabel.anchor(left: view.leftAnchor,
                        right: view.rightAnchor,
                        paddingLeft: 32.0,
                        paddingRight: 32.0)
    }
}
