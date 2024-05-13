
//  Astrologers.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.


import UIKit
import Kingfisher

//MARK: - Cell -
class Astrologers: UICollectionViewCell {
    
    //MARK: - UI -
    let identifier = "Astrologers"
    let containerView = CustomView(color: .white)
    let img = ImageView(image: UIImage(systemName: ""))
    let labelName = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .regular))
    let chatButton = Button(image: UIImage(systemName: ""), text: "", btnTitleColor: .green, backgroundColor: .clear, radius: 8, imageColor: .clear)
    
    var delegate: CellButtonDelegate?
    var index: Int?
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        addSubview(containerView)
        containerView.addSubview(img)
        containerView.addSubview(labelName)
        containerView.addSubview(chatButton)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            img.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            img.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            img.heightAnchor.constraint(equalToConstant: 70),
            img.widthAnchor.constraint(equalToConstant: 70),
            
            labelName.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 10),
            labelName.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            chatButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            chatButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            chatButton.widthAnchor.constraint(equalToConstant: 70),
            chatButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    //MARK: Configuring the cell objects and Data model -
    func configure(model: AstrologersModel) {
        for (_, value) in model.fields {
            if let url = URL(string: value){
                img.kf.setImage(with: url)
                
            } else {
                labelName.text = value
            }
        }
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.systemYellow.cgColor
        img.layer.cornerRadius = 35
        chatButton.setTitle("Chat", for: .normal)
        chatButton.setTitleColor(.systemGreen, for: .normal)
        chatButton.layer.cornerRadius = 15
        chatButton.layer.borderWidth = 2
        chatButton.layer.borderColor = UIColor.systemGreen.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
