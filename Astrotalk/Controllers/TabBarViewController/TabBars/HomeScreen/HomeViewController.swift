//
//  HomeViewController.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit

// MARK: -
class HomeViewController: HomeBaseViewController {
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        configureProperties()
    }
    
    //MARK: - Configuring UI -
    private func configureProperties() {
        titleText.text = "Astrotalk"
        sideBarButton.addTarget(self, action: #selector(toggleSideBar), for: .touchUpInside)
    }
    
    //MARK: - Override Method from BaseViewController -
    override func toggleSideBar() {
        super.toggleSideBar()
    }
    
    // MARK: - Subviews and Layout -
    internal override func setSubviewsAndLayout() {
        super.setSubviewsAndLayout()
    }
    
    //MARK: - Override Objects from BaseViewController -
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath)
        return cell
    }
}
