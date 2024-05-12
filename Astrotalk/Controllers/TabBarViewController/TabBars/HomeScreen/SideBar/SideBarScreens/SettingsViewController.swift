//
//  SettingsViewController.swift
//  Astrotalk
//
//  Created by Mac on 03/05/2024.
//

import UIKit
import FirebaseAuth

//MARK: -
class SettingsViewController: UIViewController {
    
    //MARK: - UI -
    let logoutBtn = Button(image: UIImage(), text: "Logout", btnTitleColor: .black, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(logoutBtn)
        logoutBtn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            logoutBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoutBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    //MARK: - Firebase Google logout Implementation -
    @objc func tapped() {
        let auth = Auth.auth()
        do {
            try auth.signOut()
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(loginVC, animated: false)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
