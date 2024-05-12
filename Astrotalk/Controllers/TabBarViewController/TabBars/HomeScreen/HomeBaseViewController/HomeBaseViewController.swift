//
//  HomeSectionViewController.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit

// MARK: -

class HomeBaseViewController: UIViewController {
    
    // MARK: - UI -
    var sideBarShowing = false
    var sideBarWidth: CGFloat = 0
    var topView = TopView(color: .clear)
    var overlayView = UIView()
    var topEdgesView = CustomView(color: .systemYellow)
    
    var sideBarViewController = SideBarViewController()
    
    var sideBarButton = Button(image: UIImage(systemName: "line.3.horizontal"), text: "", btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .black)
    
    var titleText = Label(label: String(), textColor: .black, font: customFont(size: 15, font: .PoppinsExtraLight))
    
    fileprivate lazy var parentCollectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemGray6
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(DailyHoroscopeCell.self, forCellWithReuseIdentifier: "DailyHoroscopeCell")
        collectionView.register(FreeChatCell.self, forCellWithReuseIdentifier: "FreeChatCell")
        collectionView.register(LiveAstrologersCell.self, forCellWithReuseIdentifier: "LiveAstrologersCell")
        collectionView.register(AstrologersCell.self, forCellWithReuseIdentifier: "AstrologersCell")
        collectionView.register(LatestBlogCell.self, forCellWithReuseIdentifier: "LatestBlogCell")
        collectionView.register(AstromallShopCell.self, forCellWithReuseIdentifier: "AstromallShopCell")
        collectionView.register(AstroTalkCell.self, forCellWithReuseIdentifier: "AstroTalkCell")
        collectionView.register(SearchBarHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchBarHeader.identifier)
        collectionView.register(LiveAstrologersHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LiveAstrologersHeaders.identifier)
        collectionView.register(AstrologersHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AstrologersHeaders.identifier)
        collectionView.register(LatestBlogHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LatestBlogHeaders.identifier)
        collectionView.register(AstroShopHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AstroShopHeaders.identifier)
        collectionView.register(AstroTalkHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AstroTalkHeaders.identifier)
        collectionView.register(FooterHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterHeader.identifier)
        return collectionView
    }()
    
    var isFeedbackViewVisible = false
    let yourFeedbackViewHeight: CGFloat = 280
    var leftSticker = Button(image: UIImage(systemName: "ellipsis.message.fill"), text: "Chat with Astrologer", btnTitleColor: .black, backgroundColor: .systemYellow, radius: 20, imageColor: .black)
    var rightSticker = Button(image: UIImage(systemName: "phone.fill"), text: "Call with Astrologer", btnTitleColor: .black, backgroundColor: .systemYellow, radius: 20, imageColor: .black)
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        toggleStickerButtonsVisibility(hidden: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setupStickerButtions()
        toggleStickerButtonsVisibility(hidden: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if self.children.contains(where: { $0 is SideBarViewController }) {
            toggleStickerButtonsVisibility(hidden: true)
        }
    }
    
    //MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(topView)
        view.addSubview(parentCollectionView)
        topView.addSubview(sideBarButton)
        topView.addSubview(titleText)
        topView.addSubview(topEdgesView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 155),
            
            topEdgesView.topAnchor.constraint(equalTo: topView.topAnchor),
            topEdgesView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            topEdgesView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            topEdgesView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            topEdgesView.heightAnchor.constraint(equalToConstant: 50),
            
            sideBarButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 124),
            sideBarButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 18),
            
            titleText.topAnchor.constraint(equalTo: topView.topAnchor, constant: 124),
            titleText.leadingAnchor.constraint(equalTo: sideBarButton.trailingAnchor, constant: 40),
            
            parentCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            parentCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            parentCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            parentCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        setupStickerButtions()
    }
}

// MARK: - Extension - 
extension HomeBaseViewController: SideBarViewControllerDelegate {
    
    // MARK: - Function to toggle in the SideBarViewController -
    @objc func toggleSideBar() {
        if sideBarShowing {
            hideSideBar()
        } else {
            showSideBar()
        }
    }
    
    // MARK: - Function to show sidebar -
    func showSideBar() {
        sideBarWidth = view.frame.width * 0.5
        sideBarViewController.delegate = self
        addChild(sideBarViewController)
        view.addSubview((sideBarViewController.view))
        sideBarViewController.view.frame = CGRect(x: -sideBarWidth, y: 0, width: sideBarWidth, height: view.frame.height)
        
        UIView.animate(withDuration: 0.3) {
            self.sideBarViewController.view.frame = CGRect(x: 0, y: 0, width: self.sideBarWidth, height: self.view.frame.height)
            self.sideBarShowing = true
        }
        topView.isHidden = true
        parentCollectionView.isHidden = true
        leftSticker.isHidden = true
        rightSticker.isHidden = true
        
        overlayView = UIView(frame: CGRect(x: Int(sideBarWidth), y: 0, width: Int(self.sideBarWidth), height: Int(self.view.frame.height)))
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(overlayView)
        view.bringSubviewToFront(sideBarViewController.view)
    }
    
    // MARK: - Function to hide sidebar -
    func hideSideBar() {
        sideBarWidth = view.frame.width * 0.5
        UIView.animate(withDuration: 0.3, animations: {
            self.sideBarViewController.view.frame = CGRect(x: -self.sideBarWidth, y: 0, width: self.sideBarWidth, height: self.view.frame.height)
        }) { (completed) in
            self.sideBarViewController.view.removeFromSuperview()
            self.sideBarViewController.removeFromParent()
            self.sideBarShowing = false
            
        }
        topView.isHidden = false
        parentCollectionView.isHidden = false
        leftSticker.isHidden = false
        rightSticker.isHidden = false
        overlayView.removeFromSuperview()
    }
    
    // MARK: - Protocol delegate method created to toggle the sidebar -
    func sideBarDidToggleBack() {
        hideSideBar()
    }
}

// MARK: - Extension - DataSource -
extension HomeBaseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyHoroscopeCell", for: indexPath) as! DailyHoroscopeCell
            cell.delegate = self
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FreeChatCell", for: indexPath) as! FreeChatCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveAstrologersCell", for: indexPath) as! LiveAstrologersCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AstrologersCell", for: indexPath) as! AstrologersCell
            cell.layer.cornerRadius = 8
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestBlogCell", for: indexPath) as! LatestBlogCell
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AstromallShopCell", for: indexPath) as! AstromallShopCell
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AstroTalkCell", for: indexPath) as! AstroTalkCell
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
}

// MARK: - Extension - Delegate -
extension HomeBaseViewController: UICollectionViewDelegate {
}

// MARK: - Extension - DelegateFlowLayout -
extension HomeBaseViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            switch indexPath.section {
            case 0:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchBarHeader.identifier, for: indexPath) as! SearchBarHeader
                header.delegate = self
                header.configure()
                return header
            case 2:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LiveAstrologersHeaders.identifier, for: indexPath) as! LiveAstrologersHeaders
                header.configure()
                return header
            case 3:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AstrologersHeaders.identifier, for: indexPath) as! AstrologersHeaders
                header.delegate = self
                header.configure()
                return header
            case 4:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LatestBlogHeaders.identifier, for: indexPath) as! LatestBlogHeaders
                header.configure()
                return header
            case 5:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AstroShopHeaders.identifier, for: indexPath) as! AstroShopHeaders
                header.delegate = self
                header.configure()
                return header
            case 6:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AstroTalkHeaders.identifier, for: indexPath) as! AstroTalkHeaders
                header.configure()
                return header
            default:
                break
            }
        } else if kind == UICollectionView.elementKindSectionFooter && isFeedbackViewVisible {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterHeader.identifier, for: indexPath) as! FooterHeader
            footer.configure()
            return footer
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: 300, height: 60)
        case 2:
            return CGSize(width: 300, height: 40)
        case 3:
            return CGSize(width: 300, height: 40)
        case 4:
            return CGSize(width: 300, height: 40)
        case 5:
            return CGSize(width: 300, height: 40)
        case 6:
            return CGSize(width: 300, height: 40)
        default:
            break
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 120)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 100)
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 180)
        case 3:
            return CGSize(width: collectionView.bounds.width, height: 180)
        case 4:
            return CGSize(width: collectionView.bounds.width, height: 180)
        case 5:
            return CGSize(width: collectionView.bounds.width, height: 180)
        case 6:
            return CGSize(width: collectionView.bounds.width, height: 200)
        default:
            break
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == numberOfSections(in: collectionView) - 1 && isFeedbackViewVisible {
            let remainingSpace = max(0, collectionView.bounds.height - collectionView.contentSize.height + collectionView.contentInset.bottom)
            return CGSize(width: collectionView.bounds.width, height: max(remainingSpace, yourFeedbackViewHeight))
        } else {
            return .zero
        }
    }
    
    //MARK: - Scrolling space at the bottom of the UI -
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let boundsHeight = scrollView.bounds.height
        let footerHeight = yourFeedbackViewHeight - view.bounds.size.height
        
        let thresholdToShowFooter = contentHeight - boundsHeight + footerHeight
        
        if offsetY > thresholdToShowFooter {
            if !isFeedbackViewVisible {
                isFeedbackViewVisible = true
                parentCollectionView.reloadData()
            }
        } else {
            if isFeedbackViewVisible {
                isFeedbackViewVisible = false
                parentCollectionView.reloadData()
            }
        }
    }
}

//MARK: - Extensions -
extension HomeBaseViewController {
    
    func setupStickerButtions() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let topMostView = windowScene.windows.first else { return }
        
        //MARK: - Left Sticker Button -
        leftSticker.translatesAutoresizingMaskIntoConstraints = false
        topMostView.addSubview(leftSticker)
        leftSticker.bottomAnchor.constraint(equalTo: topMostView.bottomAnchor, constant: -100).isActive = true
        leftSticker.leadingAnchor.constraint(equalTo: topMostView.leadingAnchor, constant: 14).isActive = true
        leftSticker.widthAnchor.constraint(equalToConstant: 170).isActive = true
        leftSticker.heightAnchor.constraint(equalToConstant: 45).isActive = true
        leftSticker.addTarget(self, action: #selector(leftStickerBtnTapped), for: .touchUpInside)
        
        //MARK: - Right Sticker Button -
        rightSticker.translatesAutoresizingMaskIntoConstraints = false
        topMostView.addSubview(rightSticker)
        rightSticker.bottomAnchor.constraint(equalTo: topMostView.bottomAnchor, constant: -100).isActive = true
        rightSticker.trailingAnchor.constraint(equalTo: topMostView.trailingAnchor, constant: -14).isActive = true
        rightSticker.widthAnchor.constraint(equalToConstant: 170).isActive = true
        rightSticker.heightAnchor.constraint(equalToConstant: 45).isActive = true
        rightSticker.addTarget(self, action: #selector(rightStickerBtnTapped), for: .touchUpInside)
    }
    
    func toggleStickerButtonsVisibility(hidden: Bool) {
        leftSticker.isHidden = hidden
        rightSticker.isHidden = hidden
    }
}

extension HomeBaseViewController: CellSelectedDelegate {
    func cellSelected(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension HomeBaseViewController: CellButtonDelegate {
    func didButtonTapped(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension HomeBaseViewController {
    @objc func leftStickerBtnTapped() {
        let chatTabBarVC = ChatViewController()
        navigationController?.pushViewController(chatTabBarVC, animated: false)
    }
    
    @objc func rightStickerBtnTapped() {
        let chatTabBarVC = CallViewController()
        navigationController?.pushViewController(chatTabBarVC, animated: false)
    }
}

extension HomeBaseViewController: SearchBarDelegate {
    func searchBarDidTap() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension HomeBaseViewController: ViewAllAstrologersButtonDelegate {
    func viewAstrologerButtonDidTap() {
        let vc = ChatViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension HomeBaseViewController: ViewAllAstroShopButtonDelegate {
    func viewAstroShopButtonDidTap() {
        let vc = MessageViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

