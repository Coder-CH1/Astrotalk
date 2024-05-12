//
//  ShopCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
import Kingfisher

//MARK: - Cell -
class ShopCell: UICollectionViewCell {
    
    //MARK: - UI -
    let identifier = "ShopCell"
    let containerView = CustomView(color: .white)
    let img = ImageView(image: UIImage(systemName: ""))
    let labelName = Label(label: "", textColor: .white, font: UIFont.systemFont(ofSize: 18, weight: .semibold))
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        addSubview(containerView)
        containerView.addSubview(img)
        img.addSubview(labelName)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            img.topAnchor.constraint(equalTo: containerView.topAnchor),
            img.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            img.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            img.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            labelName.centerXAnchor.constraint(equalTo: img.centerXAnchor),
            labelName.centerYAnchor.constraint(equalTo: img.centerYAnchor),
        ])
    }
    
    func configure(model: AstroMallShopModel) {
        for (key, value) in model.fields {
            print("configuring model for shop: \(value)")
            if let url = URL(string: value){
                img.kf.setImage(with: url)
                
            } else {
                labelName.text = value
            }
        }
        img.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
