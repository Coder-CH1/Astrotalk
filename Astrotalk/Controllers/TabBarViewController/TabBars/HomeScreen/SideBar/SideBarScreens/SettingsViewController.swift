//
//  SettingsViewController.swift
//  Astrotalk
//
//  Created by Mac on 03/05/2024.
//

import UIKit

//MARK: -
class SettingsViewController: UIViewController {
    
    //MARK: - UI -
    let logoutBtn = Button(image: UIImage(), text: "Logout", btnTitleColor: .black, backgroundColor: .clear, radius: 0, imageColor: .clear)
    let chatButton = Button(image: UIImage(systemName: ""), text: "button", btnTitleColor: .green, backgroundColor: .clear, radius: 8, imageColor: .clear)
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(logoutBtn)
        view.addSubview(chatButton)
        chatButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            logoutBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            logoutBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            
            chatButton.bottomAnchor.constraint(equalTo: logoutBtn.bottomAnchor, constant: 200),
            chatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatButton.widthAnchor.constraint(equalToConstant: 70),
            chatButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc func tapped() {
        let vc = MessageViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
