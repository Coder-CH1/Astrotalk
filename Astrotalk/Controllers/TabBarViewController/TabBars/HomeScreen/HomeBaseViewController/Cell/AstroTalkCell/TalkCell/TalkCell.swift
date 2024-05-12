//
//  TalkCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
import Kingfisher
import LinkPresentation
import WebLinkPreview

//MARK: - Cell -
class TalkCell: UICollectionViewCell {
    
    //MARK: - UI -
    let identifier = "TalkCell"
    var linkView: LPLinkView?
    let containerView = CustomView(color: .white)
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLinkView()
    }
    
    //MARK: - Setting up the UI
    private func setupLinkView() {
        addSubview(containerView)
        let linkView = LPLinkView()
        linkView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(linkView)
        self.linkView = linkView
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            linkView.topAnchor.constraint(equalTo: containerView.topAnchor),
            linkView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            linkView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            linkView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
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

