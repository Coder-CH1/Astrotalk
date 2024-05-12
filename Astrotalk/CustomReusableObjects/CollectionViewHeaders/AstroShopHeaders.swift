//
//  AstroShopHeaders.swift
//  Astrotalk
//
//  Created by Mac on 28/04/2024.
//

import UIKit
// MARK: - Reusableview for the section headers
class AstroShopHeaders: UICollectionReusableView {
    
    //MARK: - Objects initialization
    static let identifier = "AstroShopHeaders"
    var delegate: ViewAllAstroShopButtonDelegate?
    
    let astroShopLabel = Label(label: "Shop at Astromall", textColor: .black, font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    let viewAllBtn = Button(image: UIImage(), text: "View All", btnTitleColor: .lightGray, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    public func configure() {
        addSubview(astroShopLabel)
        addSubview(viewAllBtn)
    }
    
    //MARK: - Lifecycle -
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSectionHeaders()
    }
    
    //MARK: - Subviews and Layout -
    func setupSectionHeaders() {
        viewAllBtn.addTarget(self, action: #selector(btnTappedAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
            astroShopLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            astroShopLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            viewAllBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewAllBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        ])
    }
    
    @objc func btnTappedAction() {
        delegate?.viewAstroShopButtonDidTap()
    }
}

