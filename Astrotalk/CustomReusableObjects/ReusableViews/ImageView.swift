//
//  ImageView.swift
//  Astrotalk
//
//  Created by Mac on 12/04/2024.
//

import UIKit

// MARK: - ReusableObject -
class ImageView: UIImageView {
    
    // MARK: - Object property and value initialization -
    override init(image: UIImage?) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        self.tintColor = .lightGray
        self.isUserInteractionEnabled = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
