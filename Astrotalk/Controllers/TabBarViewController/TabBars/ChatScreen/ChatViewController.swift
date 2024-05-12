//
//  ChatViewController.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit

//MARK: -
class ChatViewController: BaseViewController {
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        configureProperties()
    }
    
    //MARK: - Configuring objects properties -
    private func configureProperties() {
        titleText.text = "Chat with Astrologer"
        sideBarButton.addTarget(self, action: #selector(toggleSideBar), for: .touchUpInside)
        rightSearchButton.addTarget(self, action: #selector(toggleSearchVC), for: .touchUpInside)
        self.segmentedCollectionView.reloadData()
    }
    
    //MARK: - Override Method from BaseViewController -
    override func toggleSideBar() {
        super.toggleSideBar()
    }
    
    //MARK: - Override Method from BaseViewController -
    override func toggleSearchVC() {
        super.toggleSearchVC()
    }
    
    // MARK: - Subviews and Layout -
    override func setSubviewsAndLayout() {
        super.setSubviewsAndLayout()
    }
    
    //MARK: - Override Method from BaseViewController -
    override func setupCustomViews() {
        super.setupCustomViews()
    }
    
    //MARK: - Override Objects from BaseViewController -
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath)
        return cell
    }
}
