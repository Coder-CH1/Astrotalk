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
    let img = ImageView(image: UIImage(systemName: ""))
    let labelName = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        addSubview(img)
        addSubview(labelName)
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            img.centerXAnchor.constraint(equalTo: centerXAnchor),
            img.widthAnchor.constraint(equalToConstant: 60),
            img.heightAnchor.constraint(equalToConstant: 60),
            
            labelName.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 5),
            labelName.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    //MARK: Configuring the cell objects and Data model -
    func configure(model: LiveAstrologersModel) {
        for (_, value) in model.fields {
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
