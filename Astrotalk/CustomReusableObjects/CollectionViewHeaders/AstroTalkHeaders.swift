//
//  AstroTalkHeaders.swift
//  Astrotalk
//
//  Created by Mac on 28/04/2024.
//

import UIKit
// MARK: - Reusableview for the section headers
class AstroTalkHeaders: UICollectionReusableView {
    
    //MARK: - Objects initialization
    static let identifier = "AstroTalkHeaders"
    
    let astroTalkLabel = Label(label: "Astrotalk in News", textColor: .black, font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    let viewAllBtn = Button(image: UIImage(), text: "View All", btnTitleColor: .lightGray, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    public func configure() {
        addSubview(astroTalkLabel)
        addSubview(viewAllBtn)
    }
    
    //MARK: - Lifecycle -
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSectionHeaders()
    }
    
    //MARK: - Subviews and Layout -
    func setupSectionHeaders() {
        NSLayoutConstraint.activate([
            astroTalkLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            astroTalkLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            viewAllBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewAllBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        ])
    }
}
