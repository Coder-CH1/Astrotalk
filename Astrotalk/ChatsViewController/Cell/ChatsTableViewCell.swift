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
    let bubbleChatsView = CustomView(color: .clear)
    let chatsLabel = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .regular))
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
        bubbleChatsView.layer.cornerRadius = 10
        
        addSubview(bubbleChatsView)
        bubbleChatsView.addSubview(chatsLabel)
        NSLayoutConstraint.activate([
            bubbleChatsView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            bubbleChatsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            bubbleChatsView.widthAnchor.constraint(equalToConstant: 200),
            
            chatsLabel.topAnchor.constraint(equalTo: bubbleChatsView.topAnchor, constant: 5),
            chatsLabel.leadingAnchor.constraint(equalTo: bubbleChatsView.leadingAnchor, constant: 5),
            chatsLabel.trailingAnchor.constraint(equalTo: bubbleChatsView.trailingAnchor, constant: -5),
            chatsLabel.bottomAnchor.constraint(equalTo: bubbleChatsView.bottomAnchor, constant: -5),
        ])
        
        if isCurrentUser {
            NSLayoutConstraint.activate([
                bubbleChatsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
                bubbleChatsView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 14),
            ])
        } else {
            NSLayoutConstraint.activate([
                bubbleChatsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
                bubbleChatsView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -14),
            ])
        }
    }
}
