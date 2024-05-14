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
    let img = ImageView(image: UIImage(systemName: ""))
    let labelName = Label(label: "", textColor: .white, font: UIFont.systemFont(ofSize: 18, weight: .semibold))
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        addSubview(img)
        img.addSubview(labelName)
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: topAnchor),
            img.leadingAnchor.constraint(equalTo: leadingAnchor),
            img.trailingAnchor.constraint(equalTo: trailingAnchor),
            img.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            labelName.centerXAnchor.constraint(equalTo: img.centerXAnchor),
            labelName.centerYAnchor.constraint(equalTo: img.centerYAnchor),
        ])
    }
    
    //MARK: Configuring the cell objects and Data model -
    func configure(model: AstroMallShopModel) {
        for (_, value) in model.fields {
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
