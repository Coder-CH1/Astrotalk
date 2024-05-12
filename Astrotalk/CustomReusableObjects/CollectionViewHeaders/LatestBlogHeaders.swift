//
//  LastestBlogHeaders.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
// MARK: - Reusableview for the section headers
class LatestBlogHeaders: UICollectionReusableView {
    
    //MARK: - Objects initialization
    static let identifier = "LatestBlogHeaders"
    
    let latestBlogLabel = Label(label: "Latest from blog", textColor: .black, font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    let viewAllBtn = Button(image: UIImage(), text: "View All", btnTitleColor: .lightGray, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    public func configure() {
        addSubview(latestBlogLabel)
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
            latestBlogLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            latestBlogLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            viewAllBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewAllBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        ])
    }
}

