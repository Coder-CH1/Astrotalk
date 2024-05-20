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
    
    let userNameLabel = Label(label: "", textColor: .gray, font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    let chatsView = CustomView(color: .systemYellow)
    
    let chatsLabel = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 16, weight: .medium))
    
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
        addSubview(chatsView)
        chatsView.addSubview(userNameLabel)
        chatsView.addSubview(chatsLabel)
        NSLayoutConstraint.activate([
            chatsView.topAnchor.constraint(equalTo: topAnchor),
            chatsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            chatsView.heightAnchor.constraint(equalToConstant: 70),
            chatsView.widthAnchor.constraint(equalToConstant: 200),

            userNameLabel.topAnchor.constraint(equalTo: chatsView.topAnchor, constant: 5),
            userNameLabel.trailingAnchor.constraint(equalTo: chatsView.trailingAnchor, constant: -5),
            userNameLabel.leadingAnchor.constraint(equalTo: chatsView.leadingAnchor, constant: 5),
            
            chatsLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 4),
            chatsLabel.leadingAnchor.constraint(equalTo: chatsView.leadingAnchor, constant: 5),
            chatsLabel.trailingAnchor.constraint(equalTo: chatsView.trailingAnchor, constant: -5),
            chatsLabel.bottomAnchor.constraint(equalTo: chatsView.bottomAnchor, constant: -5),
        ])
        chatsView.layer.cornerRadius = 15
    }
}
