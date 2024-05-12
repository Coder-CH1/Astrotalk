//
//  LiveAstrologersHeaders.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
// MARK: - Reusableview for the section headers
class LiveAstrologersHeaders: UICollectionReusableView {
    
    //MARK: - Objects initialization
    static let identifier = "LiveAstrologersHeaders"
    
    let liveAstrologersLabel = Label(label: "Live Astrologers", textColor: .black, font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    let viewAllBtn = Button(image: UIImage(), text: "View All", btnTitleColor: .lightGray, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    public func configure() {
        addSubview(liveAstrologersLabel)
        addSubview(viewAllBtn)
    }
    
    //MARK: - Lifecycle -
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSectionHeaders()
    }
    
    // MARK: - Subviews and Layout -
    func setupSectionHeaders() {
        NSLayoutConstraint.activate([
            liveAstrologersLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            liveAstrologersLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            viewAllBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewAllBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        ])
    }
}

