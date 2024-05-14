//
//  PaddingLabel.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit

// MARK: - ReusableObject -
import UIKit

class PaddedLabel: UILabel {
    let padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += padding.left + padding.right
        contentSize.height += padding.top + padding.bottom
        return contentSize
    }
}

