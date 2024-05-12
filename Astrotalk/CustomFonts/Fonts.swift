//
//  Fonts.swift
//  Astrotalk
//
//  Created by Mac on 12/04/2024.
//

import Foundation
import UIKit

// MARK: - Custom Fonts -
enum FontFamily: String{
    case PoppinsExtraLight = "Poppins-ExtraLight"
    case PoppinsLightItalic = "Poppins-LightItalic"
    case PoppinsMedium = "Poppins-Medium "
    case PoppinsBoldItalic = "Poppins-BoldItali"
    case PoppinsLight = "Poppins-Light"
    case PoppinsThinItalic = "Poppins-ThinItalic"
    case PoppinsThin = "Poppins-Thin"
    case PoppinsBold = "Poppins-Bold"
    case PoppinsMediumItalic = "Poppins-MediumItalic"
    case PoppinsBlackItalic = "Poppins-BlackItalic"
    case PoppinsSemiBold = "Poppins-SemiBold"
    case PoppinsBlack = "Poppins-Black"
    case PoppinsExtraBold = "Poppins-ExtraBold"
    case PoppinsRegular = "Poppins-Regular"
    case PoppinsItalic = "Poppins-Italic"
    case PoppinsSemiBoldItalic = "Poppins-SemiBoldItalic"
    case PoppinsExtraBoldItalic = "Poppins-ExtraBoldItalic"
}

func customFont(size: CGFloat, font: FontFamily) -> UIFont {
    guard let customFont = UIFont(name: font.rawValue, size: size) else {
        return UIFont.systemFont(ofSize: size)
    }
    return customFont
}


