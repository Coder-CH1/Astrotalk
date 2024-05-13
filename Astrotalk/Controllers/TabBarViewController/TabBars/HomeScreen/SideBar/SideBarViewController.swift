//
//  SideBarViewController.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit
import Firebase
import FirebaseStorage
import GoogleSignIn

// MARK: -
class SideBarViewController: UIViewController {
    
    // MARK: - UI -
    var delegate: SideBarViewControllerDelegate?
    var sideBarOpen = false
    
    var sideBarItems: [SideBarItem] = [userItem, homeItem, poojaItem, orderItem, shopItem, blogItem, chatItem, settingsItem, loginItem]
    
    fileprivate lazy var toggleBackButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.addTarget(self, action: #selector(toggleBackButtonTapped), for: .touchUpInside)
        btn.tintColor = .black
        return btn
    }()
    
    lazy var sidebarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SideBarCell.self, forCellWithReuseIdentifier: "SideBarCell")
        return collectionView
    }()
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
        if !sideBarItems.isEmpty {
            sidebarCollectionView.reloadData()
        }
    }
  
    // MARK: - Action back button tapped -
    @objc func toggleBackButtonTapped() {
        delegate?.sideBarDidToggleBack()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(toggleBackButton)
        view.addSubview(sidebarCollectionView)
        NSLayoutConstraint.activate([
            sidebarCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            sidebarCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sidebarCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            sidebarCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            toggleBackButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            toggleBackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
}

//MARK: - Extensions  - DataSource, Delegate, DelegateFlowLayout
extension SideBarViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sideBarItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SideBarCell", for: indexPath) as! SideBarCell
        let model = sideBarItems[indexPath.item]
        cell.configure(data: model)
        cell.userIconCell.layer.cornerRadius = 25
        cell.userIconCell.clipsToBounds = true
        if indexPath.item == 0 {
            if let currentUser = Auth.auth().currentUser {
                cell.userLabelCell.text = currentUser.email
                cell.userLabelCell.tintColor = .black
            } else {
                cell.userLabelCell.isHidden = true
            }
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            navigateToProfileViewController()
        case 1:
            navigateToHomeViewController()
        case 2:
            navigateToPoojaViewController()
        case 3:
            navigateToOrderViewController()
        case 4:
            navigateToShopViewController()
        case 5:
            navigateToBlogViewController()
        case 6:
            navigateToChatViewController()
        case 7:
            navigateToSettingsViewController()
        case 8:
            navigateToLoginViewController()
        default:
            break
        }
    }
}

//MARK: - Functions to navigate from the SideBar Contents to their respective ViewControllers
extension SideBarViewController {
    func navigateToProfileViewController() {
        guard let selectedIndexPath = sidebarCollectionView.indexPathsForSelectedItems?.first else { return }
        guard let cell = sidebarCollectionView.cellForItem(at: selectedIndexPath) as? SideBarCell else { return }
        if Auth.auth().currentUser != nil {
            let vc = UserProfileViewController()
            vc.profileImage.image = cell.userIconCell.image
            vc.profileUser.text = cell.userLabelCell.text
            navigationController?.pushViewController(vc, animated: false)
            self.navigationController?.navigationBar.tintColor = .black
        }else {
            navigateToLoginViewController()
        }
    }
    
    func navigateToHomeViewController() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func navigateToPoojaViewController() {
        let vc = PoojaViewController()
        navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func navigateToOrderViewController() {
        let vc = OrderViewController()
        navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func navigateToShopViewController() {
        let vc = ShopViewController()
        navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func navigateToBlogViewController() {
        let vc = BlogViewController()
        navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func navigateToChatViewController() {
        let vc = ChatViewController()
        navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func navigateToSettingsViewController() {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func navigateToLoginViewController() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.navigationBar.tintColor = .black
    }
}
