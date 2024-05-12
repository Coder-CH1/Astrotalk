//
//  Button.swift
//  Astrotalk
//
//  Created by Mac on 12/04/2024.
//

import UIKit

// MARK: - ReusableObject -
class Button: UIButton {
    
    // MARK: - Object property and value initialization -
    init(image: UIImage?, text: String, btnTitleColor: UIColor, backgroundColor: UIColor, radius: CGFloat, imageColor: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(image, for: .normal)
        self.setTitle(text, for: .normal)
        self.setTitleColor(btnTitleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = radius
        self.tintColor = imageColor
        self.isUserInteractionEnabled = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIButton {
    func underlineText() {
        if let text = self.titleLabel?.text {
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
            self.setAttributedTitle(attributedString, for: .normal)
        }
    }
}
