//
//  ChatsTableViewCell.swift
//  Astrotalk
//
//  Created by Mac on 12/05/2024.
//

import UIKit
import FirebaseAuth

//MARK: -
class ChatsTableViewCell: UITableViewCell {
    //MARK: - UI -
    let identifier = "ChatsTableViewCell"
    lazy var leftAlignedLabel: PaddedLabel = {
        let leftAlignedLabel = PaddedLabel()
        leftAlignedLabel.translatesAutoresizingMaskIntoConstraints = false
        leftAlignedLabel.textColor = .black
        leftAlignedLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        leftAlignedLabel.textAlignment = .left
        leftAlignedLabel.backgroundColor = .green
        leftAlignedLabel.numberOfLines = 0
        return leftAlignedLabel
    }()
    
    lazy var rightAlignedLabel: PaddedLabel = {
        let rightAlignedLabel = PaddedLabel()
        rightAlignedLabel.translatesAutoresizingMaskIntoConstraints = false
        rightAlignedLabel.textColor = .black
        rightAlignedLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        rightAlignedLabel.textAlignment = .right
        rightAlignedLabel.backgroundColor = .blue
        rightAlignedLabel.numberOfLines = 0
        return rightAlignedLabel
    }()
    let isCurrentUser = false
    
    //MARK: - Lifecyle -
    override func awakeFromNib() {
        super.awakeFromNib()
        subviewsAndLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        subviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func subviewsAndLayout() {
        addSubview(leftAlignedLabel)
        addSubview(rightAlignedLabel)
        NSLayoutConstraint.activate([
            leftAlignedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            leftAlignedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            leftAlignedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            leftAlignedLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            rightAlignedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            rightAlignedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            rightAlignedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            rightAlignedLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}
