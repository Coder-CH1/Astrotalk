//
//  AppCoordinator.swift
//  Astrotalk
//
//  Created by Mac on 19/05/2024.
//


import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var homeBaseViewController: HomeBaseViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        homeBaseViewController = HomeBaseViewController()
        navigationController.pushViewController(homeBaseViewController!, animated: false)
    }
    
    func navigateToMessageVC() {
        let vc = MessageViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}

class SideBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    //var sideBarViewController: SideBarViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToUserPoojaVC() {
        let vc = PoojaViewController.init()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToHomeVC() {
        let vc = HomeViewController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToOrderVC() {
        let vc = OrderViewController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToShopVC() {
        let vc = ShopViewController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToBlogVC() {
        let vc = BlogViewController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToChatVC() {
        let vc = ChatViewController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToSettingsVC() {
        let vc = SettingsViewController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToLoginVC() {
        let vc = LoginViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
