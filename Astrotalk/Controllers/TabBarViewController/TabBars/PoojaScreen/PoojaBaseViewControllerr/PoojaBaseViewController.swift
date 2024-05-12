//
//  PoojaTopSectionVC.swift
//  Astrotalk
//
//  Created by Mac on 20/04/2024.
//

import UIKit

//MARK: -
class PoojaBaseViewController: UIViewController {
    
    // MARK: - UI -
    var sideBarShowing = false
    let sideBarWidth: CGFloat = 250
    let topView = TopView(color: .systemYellow)
    var overlayView = UIView()
    
    var sideBarViewController = SideBarViewController()
    
    let sideBarButton = Button(image: UIImage(systemName: "line.3.horizontal"), text: String(), btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .black)
    
    var titleText = Label(label: String(), textColor: .black, font: customFont(size: 15, font: .PoppinsExtraLight))
    
    var rightSearchButton = Button(image: UIImage(systemName: "magnifyingglass"), text: String(), btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .black)
    
        var poojaAllView = PoojaAllView()
        var poojaLoveView = PoojaLoveView()
        var poojaEducationView = PoojaEducationView()
        var poojaCareerView = PoojaCareerView()
        var poojaMarriageView = PoojaMarriageView()
        var poojaHealthView = PoojaHealthView()
        var poojaWealthView = PoojaWealthView()
        var poojaFinanceView = PoojaFinanceView()
        var poojaKidsView = PoojaKidsView()
    
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
            collectionView.register(CustomSegmentedControlCell.self, forCellWithReuseIdentifier: "CustomSegmentedControlCell")
            return collectionView
        }()
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
        setupCustomViews()
        buttonData = segmentedArray
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        topView.addSubview(sideBarButton)
        topView.addSubview(titleText)
        topView.addSubview(rightSearchButton)
        let subviews = [topView, segmentedCollectionView, poojaAllView, poojaLoveView, poojaEducationView, poojaCareerView, poojaMarriageView, poojaHealthView, poojaWealthView, poojaFinanceView, poojaKidsView]
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
            
            segmentedCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 2),
            segmentedCollectionView.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: 8),
            segmentedCollectionView.trailingAnchor.constraint(equalTo:  view.trailingAnchor, constant: -8),
            segmentedCollectionView.heightAnchor.constraint(equalToConstant: 49),

            poojaAllView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaAllView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaAllView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaAllView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            poojaLoveView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaLoveView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaLoveView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaLoveView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            poojaEducationView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaEducationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaEducationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaEducationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            poojaCareerView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaCareerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaCareerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaCareerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            poojaMarriageView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaMarriageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaMarriageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaMarriageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            poojaHealthView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaHealthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaHealthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaHealthView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            poojaWealthView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaWealthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaWealthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaWealthView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            poojaFinanceView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaFinanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaFinanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaFinanceView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            poojaKidsView.topAnchor.constraint(equalTo: segmentedCollectionView.bottomAnchor, constant: 20),
            poojaKidsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            poojaKidsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            poojaKidsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
    
    func setupCustomViews() {
        poojaAllView.isHidden = false
        poojaLoveView.isHidden = true
        poojaEducationView.isHidden = true
        poojaCareerView.isHidden = true
        poojaMarriageView.isHidden = true
        poojaHealthView.isHidden = true
        poojaWealthView.isHidden = true
        poojaFinanceView.isHidden = true
        poojaKidsView.isHidden = true
        poojaAllView.translatesAutoresizingMaskIntoConstraints = false
        poojaLoveView.translatesAutoresizingMaskIntoConstraints = false
        poojaEducationView.translatesAutoresizingMaskIntoConstraints = false
        poojaCareerView.translatesAutoresizingMaskIntoConstraints = false
        poojaMarriageView.translatesAutoresizingMaskIntoConstraints = false
        poojaHealthView.translatesAutoresizingMaskIntoConstraints = false
        poojaWealthView.translatesAutoresizingMaskIntoConstraints = false
        poojaFinanceView.translatesAutoresizingMaskIntoConstraints = false
        poojaKidsView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension PoojaBaseViewController: SideBarViewControllerDelegate {
    //MARK: - Function to hide all views in SidebarViewController -
    func hideAllViews() {
        poojaAllView.isHidden = true
        topView.isHidden = true
        rightSearchButton.isHidden = true
        segmentedCollectionView.isHidden = true
    }
   
    //MARK: - Function to show all views in SidebarViewController -
    func showAllViews() {
        poojaAllView.isHidden = false
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

//MARK: - Extension DataSource, Delegate, DelegateFlowLayout
extension PoojaBaseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CustomSegmentedControlDelegate {
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
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
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
        let views = [poojaAllView, poojaLoveView, poojaEducationView, poojaCareerView, poojaMarriageView, poojaHealthView, poojaWealthView, poojaFinanceView, poojaKidsView]
        for (index, view) in views.enumerated() {
            view.isHidden = index != segmentIndex
        }
    }
}

