//
//  AstrologerProfileViewController.swift
//  Astrotalk
//
//  Created by Mac on 03/05/2024.
//

import UIKit

//MARK: -
class AstrologerProfileViewController: UIViewController {
    
    //MARK: - UI -
    let topView = TopView(color: .systemYellow)
    let profileImage = ImageView(image: UIImage(systemName: "person.circle"))
    let profileEmail = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 14, weight: .bold))
    let profileName = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    let expYrs = Label(label: "", textColor: .gray, font: UIFont.systemFont(ofSize: 14, weight: .bold))
    let biography = Label(label: "", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    let chatButton = Button(image: UIImage(systemName: "ellipsis.message.fill"), text: "", btnTitleColor: .black, backgroundColor: .clear, radius: 0, imageColor: .systemYellow)
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        chatButton.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        let subviews = [topView, profileImage, profileEmail, profileName, expYrs, biography, chatButton]
        for subview in subviews {
            view.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.width),
            topView.heightAnchor.constraint(equalToConstant: 155),
            
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 70),
            profileImage.heightAnchor.constraint(equalToConstant: 70),
            
            profileEmail.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            profileEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileName.topAnchor.constraint(equalTo: profileEmail.bottomAnchor, constant: 20),
            profileName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            expYrs.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 10),
            expYrs.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            biography.topAnchor.constraint(equalTo: expYrs.bottomAnchor, constant: 50),
            biography.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            chatButton.topAnchor.constraint(equalTo: biography.bottomAnchor, constant: 20),
            chatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    //MARK: -
    @objc func btnTapped() {
        let vc = MessageViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
