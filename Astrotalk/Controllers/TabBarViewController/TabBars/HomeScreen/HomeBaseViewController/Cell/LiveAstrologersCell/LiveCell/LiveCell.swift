//
//  LiveCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit

//MARK: - Cell -
class LiveCell: UICollectionViewCell {
    
    //MARK: - UI -
    let identifier = "LiveCell"
    let containerView = CustomView(color: .white)
    let img = ImageView(image: UIImage(systemName: ""))
    let labelName = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
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
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            img.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            img.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            img.widthAnchor.constraint(equalToConstant: 60),
            img.heightAnchor.constraint(equalToConstant: 60),
            
            labelName.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 5),
            labelName.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            labelName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    //MARK: Configuring the cell objects and Data model -
    func configure(model: LiveAstrologersModel) {
        for (key, value) in model.fields {
            if let url = URL(string: value){
                img.kf.setImage(with: url)
            } else {
                labelName.text = value
            }
        }
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.systemYellow.cgColor
        img.layer.cornerRadius = 30
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
