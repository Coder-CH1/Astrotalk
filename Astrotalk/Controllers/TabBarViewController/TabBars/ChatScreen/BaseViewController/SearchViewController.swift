//
//  SearchViewController.swift
//  Astrotalk
//
//  Created by Mac on 30/04/2024.
//

import UIKit
//MARK: -
class SearchViewController: UIViewController {
    //MARK: - UI
    var topEdgesView = CustomView(color: .systemYellow)
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(topEdgesView)
        NSLayoutConstraint.activate([
            topEdgesView.topAnchor.constraint(equalTo: view.topAnchor),
            topEdgesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topEdgesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topEdgesView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            topEdgesView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
