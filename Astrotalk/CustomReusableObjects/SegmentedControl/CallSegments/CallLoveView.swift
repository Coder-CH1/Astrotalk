//
//  CallLoveView.swift
//  Astrotalk
//
//  Created by Mac on 19/05/2024.
//

import UIKit

class CallLoveView: UIView {
    
    // MARK: - UI -
    let collection = CustomCallCollectionView(frame: .zero)
    
    // MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
        backgroundColor = .systemGray5
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        self.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
