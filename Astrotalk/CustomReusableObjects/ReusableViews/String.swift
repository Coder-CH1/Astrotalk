//
//  String.swift
//  Astrotalk
//
//  Created by Mac on 25/04/2024.
//

import UIKit

// MARK: - ReusableObject -
extension String {
    func getAttributedBoldText(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self, attributes: [.foregroundColor: UIColor.blue])
        if let range = self.range(of: text) {
            let startIndex = self.distance(from: self.startIndex, to: range.lowerBound)
            let range = NSMakeRange(startIndex, text.count)
            attributedString.addAttributes([.font : UIFont.boldSystemFont(ofSize: 20)], range: range)
        }
        return attributedString
    }
}
