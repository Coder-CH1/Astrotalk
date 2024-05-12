//
//  CallViewController.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit

//MARK: -
class CallViewController: BaseViewController {
  
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProperties()
    }
   
    //MARK: - Configuring objects properties -
    private func configureProperties() {
        titleText.text = "Call with Astrologer"
        sideBarButton.addTarget(self, action: #selector(toggleSideBar), for: .touchUpInside)
        rightSearchButton.addTarget(self, action: #selector(toggleSearchVC), for: .touchUpInside)
        self.segmentedCollectionView.reloadData()
    }
    
    override func toggleSideBar() {
        super.toggleSideBar()
    }
    
    override func toggleSearchVC() {
        super.toggleSearchVC()
    }
    
    // MARK: - Subviews and Layout -
    override func setSubviewsAndLayout() {
        super.setSubviewsAndLayout()
    }
    
    override func setupCustomViews() {
        super.setupCustomViews()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath)
        return cell
    }
}
