//
//  ProtocolDelegates.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit

//MARK: - Protocols -
protocol SideBarViewControllerDelegate {
    func sideBarDidToggleBack()
}

protocol SegmentedProtocolDelegates {
    func segmentedControlDidChange(selectedIndex: Int)
}

protocol CustomSegmentedControlDelegate {
    func didSelectItemAtIndex(_ segmentIndex: Int)
}

protocol TouchHandling {
    func handleTouch(at point: CGPoint)
}

protocol SideBarCollectionViewCellDelegate {
    func didSelectImage(cell: SideBarCell)
}

protocol ProfileDatatDelegate {
    func didSelectProfile(image: UIImage?, name: String?)
}

protocol CellSelectedDelegate {
    func cellSelected(_ vc: UIViewController)
}

protocol CellButtonDelegate {
    func didButtonTapped(_ vc: UIViewController)
}

protocol HideStickerButtonDelegate {
    func sideBarDidToggleBack()
    func toggleStickerButtonsVisibility(hidden: Bool)
}

protocol SearchBarDelegate {
    func searchBarDidTap()
}

protocol ViewAllAstrologersButtonDelegate {
    func viewAstrologerButtonDidTap()
}

protocol ViewAllAstroShopButtonDelegate {
    func viewAstroShopButtonDidTap()
}

protocol StickerButtonVisibilityDelegate {
    func toggleStickerButtonsVisibility(hidden: Bool)
}

protocol ViewProfileAstrologersDelegate {
    func viewProfileAstrologersButtonCellTap(at Index: Int)
}

protocol ReusableCollectionViewDelegate {
    func presentViewController(from cell: CustomChatCell)
}

protocol AstrologerProfileDelegate {
    func didSelectAstrologer(astrologerEmail: String)
}
