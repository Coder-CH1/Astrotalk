//
//  CustomView.swift
//  Astrotalk
//
//  Created by Mac on 16/04/2024.
//

import UIKit

// MARK: - ReusableObject -
class CustomView: UIView {
    
    // MARK: - Object property and value initialization -
    init(color: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func draw(_ rect: CGRect) {
    }
}
