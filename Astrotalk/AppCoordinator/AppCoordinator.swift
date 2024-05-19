//
//  AppCoordinator.swift
//  Astrotalk
//
//  Created by Mac on 19/05/2024.
//


import UIKit

class AppCoordinator {
    var cell: FreeChatCell?
    var viewController: HomeBaseViewController?
    
    init(cell: FreeChatCell, viewController: HomeBaseViewController) {
        self.cell = cell
        self.viewController = viewController
    }
    
    func didSelectCell() {
        let newVC = MessageViewController()
        viewController?.navigationController?.pushViewController(newVC, animated: false)
    }
}
