//
//  PoojaViewController.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit

//MARK: -
class PoojaViewController: PoojaBaseViewController {
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        configureProperties()
    }
    
    //MARK: - Configuring objects properties -
    private func configureProperties() {
        titleText.text = "Book a Pooja"
        sideBarButton.addTarget(self, action: #selector(toggleSideBar), for: .touchUpInside)
        rightSearchButton.addTarget(self, action: #selector(toggleSearchVC), for: .touchUpInside)
    }
    
    //MARK: - Override Method from BaseViewController -
    override func toggleSideBar() {
        super.toggleSideBar()
    }
    
    //MARK: - Override Method from BaseViewController -
    override func toggleSearchVC() {
        super.toggleSearchVC()
    }
    
    //MARK: - Override Method from BaseViewController -
    override func setSubviewsAndLayout() {
        super.setSubviewsAndLayout()
    }
}
