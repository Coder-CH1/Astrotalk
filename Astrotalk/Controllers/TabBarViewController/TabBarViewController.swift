//
//  TabBarViewController.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit

// MARK: -
class TabBarViewController: UITabBarController, UITabBarControllerDelegate  {
    // MARK: - Wrap ViewControllers in Navigation Controllers -
    let homeVC = UINavigationController(rootViewController: HomeViewController())
    let chatVC = UINavigationController(rootViewController: ChatViewController())
    let liveVC = UINavigationController(rootViewController: LiveViewController())
    let callVC = UINavigationController(rootViewController: CallViewController())
    let poojaVC = UINavigationController(rootViewController: PoojaViewController())
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        delegate = self
        setupViewControllers()
        selectedIndex = 1
    }
    
    func setupViewControllers() {
        // MARK: - Set titles for tab bar items -
        homeVC.tabBarItem.title = "Home"
        chatVC.tabBarItem.title = "Chat"
        liveVC.tabBarItem.title = "Live"
        callVC.tabBarItem.title = "Call"
        poojaVC.tabBarItem.title = "Pooja"
        
        // MARK: - Set images for tab bar items -
        let tabBarImages = [
            UIImage(systemName: "house"),
            UIImage(systemName: "ellipsis.message.fill"),
            UIImage(systemName: "play.tv"),
            UIImage(systemName: "phone"),
            UIImage(systemName: "flame")
        ]
        
        // MARK: - Assign ViewControllers and tab bar items -
        let viewControllers = [homeVC, chatVC, liveVC, callVC, poojaVC]
        for (index, viewController) in viewControllers.enumerated() {
            viewController.tabBarItem.image = tabBarImages[index]
        }
        
        // MARK: - Set ViewControllers for the tab bar controller -
        setViewControllers(viewControllers, animated: true)
        
        // MARK: - Customize tab bar appearance -
        self.tabBar.tintColor = .black
        self.tabBar.barTintColor = .black
        self.tabBar.barTintColor = .white
        UITabBar.appearance().backgroundColor = UIColor.white
        
        // MARK: - Add a straight line at the top of the tab bar -
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5)
        topBorder.backgroundColor = UIColor.gray.cgColor
        tabBar.layer.addSublayer(topBorder)
    }
}
