//
//  CircleCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit

//MARK: - Cell -
class CircleCell: UICollectionViewCell {
    
    //MARK: - UI -
    let identifier = "CircleCell"
    var delegate: CellSelectedDelegate?
    let dailyHoroscopeImg = ImageView(image: UIImage(systemName: ""))
    let freeKundliImg = ImageView(image: UIImage(systemName: ""))
    let kundliMatchingImg = ImageView(image: UIImage(systemName: ""))
    let freeChatImg = ImageView(image: UIImage(systemName: ""))
    let dailyHoroscopeLbl = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 10, weight: .light))
    let freeKundliLbl = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 10, weight: .light))
    let kundliMatchingLbl = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 10, weight: .light))
    let freeChatLbl = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 10, weight: .light))
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        let subviews = [dailyHoroscopeImg, freeKundliImg, kundliMatchingImg, freeChatImg, dailyHoroscopeLbl, freeKundliLbl, kundliMatchingLbl, freeChatLbl]
        for subview in subviews {
            addSubview(subview)
        }
        NSLayoutConstraint.activate([
        dailyHoroscopeImg.centerYAnchor.constraint(equalTo: centerYAnchor),
        dailyHoroscopeImg.centerXAnchor.constraint(equalTo: centerXAnchor),
        dailyHoroscopeImg.widthAnchor.constraint(equalToConstant: 30),
        dailyHoroscopeImg.heightAnchor.constraint(equalToConstant: 30),
        
        freeKundliImg.centerYAnchor.constraint(equalTo: centerYAnchor),
        freeKundliImg.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        kundliMatchingImg.centerYAnchor.constraint(equalTo: centerYAnchor),
        kundliMatchingImg.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        freeChatImg.centerYAnchor.constraint(equalTo: centerYAnchor),
        freeChatImg.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        dailyHoroscopeLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
        dailyHoroscopeLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        freeKundliLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
        freeKundliLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        kundliMatchingLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
        kundliMatchingLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        freeChatLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
        freeChatLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func configure(model: Horoscope) {
        print("configuring model for horoscope: \(model)")
        dailyHoroscopeImg.image = model.img
        dailyHoroscopeImg.tintColor = .black
        dailyHoroscopeLbl.text = model.label
        freeKundliImg.image = model.img
        freeKundliImg.tintColor = .black
        freeKundliLbl.text = model.label
        kundliMatchingImg.image = model.img
        kundliMatchingImg.tintColor = .black
        kundliMatchingLbl.text = model.label
        freeChatImg.image = model.img
        freeChatImg.tintColor = .black
        freeChatLbl.text = model.label
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
