//
//  PoojaView.swift
//  Astrotalk
//
//  Created by Mac on 27/04/2024.
//

import UIKit
//MARK: -
class CustomPoojaView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UI -
    fileprivate lazy var poojaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(PoojaCell.self, forCellWithReuseIdentifier: "PoojaCell")
        return collectionView
    }()
    
    let dateLabel = Label(label: "Date", textColor: .black, font: customFont(size: 16, font: .PoppinsRegular))
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return scrollView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    private func setSubviewsAndLayout() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(poojaCollectionView)
        containerView.addSubview(dateLabel)
        let scrollContent = scrollView.contentLayoutGuide
        let scrollFrame = scrollView.frameLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            containerView.topAnchor.constraint(equalTo: scrollContent.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: scrollFrame.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollFrame.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 700),
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
            
            poojaCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            poojaCollectionView.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 14),
            poojaCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14),
            poojaCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
    
    //MARK: - DataSource, Delegate, DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PoojaCell", for: indexPath) as! PoojaCell
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
