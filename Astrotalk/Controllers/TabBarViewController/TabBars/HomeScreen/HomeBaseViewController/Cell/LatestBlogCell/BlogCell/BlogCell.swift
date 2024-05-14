//
//  BlogCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
import Kingfisher
import LinkPresentation

//MARK: - Cell -
class BlogCell: UICollectionViewCell {
    
    //MARK: - UI -
    let identifier = "BlogCell"
    var linkView: LPLinkView?
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLinkView()
    }
    
    private func setupLinkView() {
        let linkView = LPLinkView()
        linkView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(linkView)
        self.linkView = linkView
        NSLayoutConstraint.activate([
            linkView.topAnchor.constraint(equalTo: topAnchor),
            linkView.leadingAnchor.constraint(equalTo: leadingAnchor),
            linkView.trailingAnchor.constraint(equalTo: trailingAnchor),
            linkView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //MARK: Configuring the cell objects and Data model -
    func configure(with url: String) {
        guard let linkView = self.linkView else { return }
        
        if let url = URL(string: url) {
            let metadata = LPLinkMetadata()
            metadata.url = url
            linkView.metadata = metadata
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
