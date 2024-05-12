//
//  LoveView.swift
//  Astrotalk
//
//  Created by Mac on 27/04/2024.
//

import UIKit
//MARK: -
class PoojaLoveView: UIView {
    
    //MARK: - Instatiating the view for composite pattern design -
    let customPoojaView = CustomPoojaView()
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
        backgroundColor = .red
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        customPoojaView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(customPoojaView)
        NSLayoutConstraint.activate([
            customPoojaView.topAnchor.constraint(equalTo: topAnchor),
            customPoojaView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customPoojaView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customPoojaView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
