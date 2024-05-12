//
//  CustomTextFieldView.swift
//  Astrotalk
//
//  Created by Mac on 02/05/2024.
//

import UIKit

// MARK: - ReusableObjects -
class CustomTextFieldView: UIView {
    
    // MARK: - Object property and value initialization -
    init(color: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func draw(_ rect: CGRect) {
    }
}
