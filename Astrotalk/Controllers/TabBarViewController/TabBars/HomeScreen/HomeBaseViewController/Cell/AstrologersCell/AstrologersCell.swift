//
//  AstrologersCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
import Kingfisher

//MARK: - Cell -
class AstrologersCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UI -
    let firestoreService = FirestoreService.shared
    var astrologerModel: [AstrologersModel] = []
    var delegate: CellButtonDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(Astrologers.self, forCellWithReuseIdentifier: "Astrologers")
        return collectionview
    }()
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
        fetchAstrologersData()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    //MARK: - DataSource, DelegateFlowLayout -
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return astrologerModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Astrologers", for: indexPath) as! Astrologers
        cell.layer.shadowColor = UIColor.systemGray3.cgColor
        cell.backgroundColor = .white
        cell.layer.shadowOpacity = 10
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 6
        cell.layer.cornerRadius = 10
        let data = astrologerModel[indexPath.item]
        cell.configure(model: data)
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == astrologerModel.count - 1 {
                fetchAstrologersData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let vc = AstrologerProfileViewController()
        self.delegate?.didButtonTapped(vc)
    }
    
    //MARK: - Updating UI with singleton instance and fetch method -
    func fetchAstrologersData() {
        firestoreService.fetchDataForAstrologers { astrologerModels, error in
            if let error = error {
                print("Error fetching astrologers: \(error.localizedDescription)")
                
            } else {
                self.astrologerModel.append(contentsOf: astrologerModels)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
