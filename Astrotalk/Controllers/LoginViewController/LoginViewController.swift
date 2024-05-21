//
//  SignupViewController.swift
//  Astrotalk
//
//  Created by Mac on 12/04/2024.
//

import UIKit

// MARK: -
class LoginViewController: UIViewController {
    
    //MARK: - Instantiating the Child ViewControllers -
    //var coordinator: SideBarCoordinator?
    private let topSectionViewController = LoginTopSectionVC()
    private let bottomSectionViewController = LoginBottomSectionVC()
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        embedChildViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Embed ChildViewControllers to the Superview -
    func embedChildViewControllers() {
        addChild(topSectionViewController)
        addChild(bottomSectionViewController)
        
        view.addSubview(topSectionViewController.view)
        view.addSubview(bottomSectionViewController.view)
        
        topSectionViewController.didMove(toParent: self)
        bottomSectionViewController.didMove(toParent: self)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        topSectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        bottomSectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topSectionViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            topSectionViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSectionViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSectionViewController.view.heightAnchor.constraint(equalToConstant: 100),
            
            bottomSectionViewController.view.topAnchor.constraint(equalTo: topSectionViewController.view.bottomAnchor, constant: 0),
            bottomSectionViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSectionViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSectionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
