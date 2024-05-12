//
//  ChatsTableViewCell.swift
//  Astrotalk
//
//  Created by Mac on 12/05/2024.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    let identifier = "ChatsTableViewCell"
    let bubbleChatsView = CustomView(color: .clear)
    let chatsLabel = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .regular))

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
            chatsLabel.topAnchor.constraint(equalTo: bubbleChatsView.topAnchor, constant: 5),
            chatsLabel.leadingAnchor.constraint(equalTo: bubbleChatsView.leadingAnchor, constant: 5),
            chatsLabel.trailingAnchor.constraint(equalTo: bubbleChatsView.trailingAnchor, constant: -5),
            chatsLabel.bottomAnchor.constraint(equalTo: bubbleChatsView.bottomAnchor, constant: -5),
        ])
    }
}