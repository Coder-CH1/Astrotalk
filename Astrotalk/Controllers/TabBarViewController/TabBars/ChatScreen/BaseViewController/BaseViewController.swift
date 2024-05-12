//
//  ChatTopSectionVC.swift
//  Astrotalk
//
//  Created by Mac on 17/04/2024.
//

import UIKit

//MARK: -
class BaseViewController: UIViewController {
    
    // MARK: - UI -
    var sideBarShowing = false
    let sideBarWidth: CGFloat = 250
    let topView = TopView(color: .systemYellow)
    var overlayView = UIView()
    
    var sideBarViewController = SideBarViewController()
    
    let sideBarButton = Button(image: UIImage(systemName: "line.3.horizontal"), text: String(), btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .black)
    
    var titleText = Label(label: String(), textColor: .black, font: customFont(size: 15, font: .PoppinsExtraLight))
    
    var rightSearchButton = Button(image: UIImage(systemName: "magnifyingglass"), text: String(), btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .black)
    
    var allView = AllView()
    var loveView = LoveView()
    var educationView = EducationView()
    var careerView = CareerView()
    var marriageView = MarriageView()
    var healthView = HealthView()
    var wealthView = WealthView()
    var financeView = FinanceView()
    var kidsView = KidsView()
    
    var buttonData: [SegmentedControlData]? {
        didSet{
            segmentedCollectionView.reloadData()
        }
    }
    
    lazy var segmentedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = .systemGray6
        collectionView.register(CustomSegmentedControlCell.self, forCellWithReuseIdentifier: "CustomSegmentedControlCell")
        return collectionView
    }()
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonData = segmentedArray
        setSubviewsAndLayout()
        setupCustomViews()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        topView.addSubview(sideBarButton)
        topView.addSubview(titleText)
        topView.addSubview(rightSearchButton)
        let subviews = [topView, segmentedCollectionView, allView, loveView, educationView, careerView, marriageView, healthView, wealthView, financeView, kidsView]
        for subview in subviews {
            view.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 155),
            
            sideBarButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 130),
            sideBarButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 18),
            titleText.topAnchor.constraint(equalTo: topView.topAnchor, constant: 130),
            titleText.leadingAnchor.constraint(equalTo: sideBarButton.trailingAnchor, constant: 40),
            
            rightSearchButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 130),
            rightSearchButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -18),
            
            segmentedCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            segmentedCollectionView.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: 8),
            segmentedCollectionView.trailingAnchor.constraint(equalTo:  view.trailingAnchor, constant: -8),
            segmentedCollectionView.heightAnchor.constraint(equalToConstant: 49),
            
            allView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 10),
            allView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            allView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            allView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            loveView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 10),
            loveView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            loveView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            loveView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            educationView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 10),
            educationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            educationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            educationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            careerView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 10),
            careerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            careerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            careerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            marriageView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 1),
            marriageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            marriageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            marriageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            healthView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 10),
            healthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            healthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            healthView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            wealthView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 10),
            wealthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            wealthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            wealthView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            financeView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            financeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            financeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            financeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            kidsView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            kidsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            kidsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            kidsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
    
    //MARK: - Setup Custom Views representing each segment -
    func setupCustomViews() {
        allView.isHidden = false
        loveView.isHidden = true
        educationView.isHidden = true
        careerView.isHidden = true
        marriageView.isHidden = true
        healthView.isHidden = true
        wealthView.isHidden = true
        financeView.isHidden = true
        kidsView.isHidden = true
        allView.translatesAutoresizingMaskIntoConstraints = false
        loveView.translatesAutoresizingMaskIntoConstraints = false
        educationView.translatesAutoresizingMaskIntoConstraints = false
        careerView.translatesAutoresizingMaskIntoConstraints = false
        marriageView.translatesAutoresizingMaskIntoConstraints = false
        healthView.translatesAutoresizingMaskIntoConstraints = false
        wealthView.translatesAutoresizingMaskIntoConstraints = false
        financeView.translatesAutoresizingMaskIntoConstraints = false
        kidsView.translatesAutoresizingMaskIntoConstraints = false
    }
}

//MARK: - Extension -
extension BaseViewController: SideBarViewControllerDelegate {
    
    //MARK: - Function to hide all views in SidebarViewController -
    func hideAllViews() {
        allView.isHidden = true
        topView.isHidden = true
        rightSearchButton.isHidden = true
        segmentedCollectionView.isHidden = true
    }
    
    //MARK: - Function to show all views in SidebarViewController -
    func showAllViews() {
        allView.isHidden = false
        topView.isHidden = false
        rightSearchButton.isHidden = false
        segmentedCollectionView.isHidden = false
    }
    
    // MARK: - Function to toggle in the SideBarViewController -
    @objc func toggleSideBar() {
        if sideBarShowing {
            hideSideBar()
        } else {
            showSideBar()
        }
    }
    
    // MARK: - Function to toggle in the SearchViewController -
    @objc func toggleSearchVC() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK: - Function to show sidebar -
    func showSideBar() {
        sideBarViewController.delegate = self
        addChild(sideBarViewController)
        view.addSubview((sideBarViewController.view))
        sideBarViewController.view.frame = CGRect(x: -sideBarWidth, y: 0, width: sideBarWidth, height: view.frame.height)
        
        UIView.animate(withDuration: 0.3) {
            self.sideBarViewController.view.frame = CGRect(x: 0, y: 0, width: self.sideBarWidth, height: self.view.frame.height)
            self.sideBarShowing = true
        }
        hideAllViews()
        
        overlayView = UIView(frame: CGRect(x: 250, y: 0, width: Int(view.frame.width)/2, height: Int(view.frame.height)))
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.5
        view.addSubview(overlayView)
        view.bringSubviewToFront(sideBarViewController.view)
    }
    
    // MARK: - Function to hide sidebar -
    func hideSideBar() {
        UIView.animate(withDuration: 0.3, animations: {
            self.sideBarViewController.view.frame = CGRect(x: -self.sideBarWidth, y: 0, width: self.sideBarWidth, height: self.view.frame.height)
        }) { (completed) in
            self.sideBarViewController.view.removeFromSuperview()
            self.sideBarViewController.removeFromParent()
            self.sideBarShowing = false
        }
        showAllViews()
        overlayView.removeFromSuperview()
    }
    
    // MARK: - Protocol delegate method created to toggle the sidebar -
    func sideBarDidToggleBack() {
        hideSideBar()
    }
}

//MARK: - Extensions DataSource, Delegate, DelegateFlowLayout -
extension BaseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CustomSegmentedControlDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomSegmentedControlCell", for: indexPath) as! CustomSegmentedControlCell
        let model = buttonData?[indexPath.item]
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .white
        cell.delegate = self
        cell.index = indexPath.item
        cell.configure(model: model ?? SegmentedControlData(icon: UIImage(),label: String()))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
    
    //MARK: - Custom Protocol Delegate for iterating and selecting each segments -
    func didSelectItemAtIndex(_ segmentIndex: Int) {
        let views = [allView, loveView, educationView, careerView, marriageView, healthView, wealthView, financeView, kidsView]
        for (index, view) in views.enumerated() {
            view.isHidden = index != segmentIndex
        }
    }
}
