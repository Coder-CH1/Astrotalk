
//
//  CustomSegmentedControlCell.swift
//  Astrotalk
//
//  Created by Mac on 23/04/2024.
//
//

import UIKit

//MARK: -
class CustomSegmentedControlCell: UICollectionViewCell {
    
    //MARK: UI -
    var delegate: CustomSegmentedControlDelegate?
    var index: Int = 0
    
    lazy var cellButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor( .black, for: .normal)
        btn.titleLabel?.font = customFont(size: 14, font: .PoppinsRegular)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    //MARK: Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        addSubview(cellButton)
        cellButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cellButton.topAnchor.constraint(equalTo: topAnchor),
            cellButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    //MARK: - Custom Protocol Delegate
    @objc func buttonTapped() {
        delegate?.didSelectItemAtIndex(index)
    }
    
    //MARK: Referencing cell and the custom data
    func configure(model: SegmentedControlData) {
        cellButton.tag = index
        cellButton.setImage(model.icon ,for: .normal)
        cellButton.setTitle(model.label ,for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
