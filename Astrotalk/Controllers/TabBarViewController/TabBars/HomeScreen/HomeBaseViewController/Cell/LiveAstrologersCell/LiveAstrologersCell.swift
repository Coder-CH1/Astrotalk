//
//  LiveAstrologersCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit

//MARK: - Cell -
class LiveAstrologersCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UI -
    let firestoreService = FirestoreService.shared
    var liveAstrologerArray: [LiveAstrologersModel] = []
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 2
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(LiveCell.self, forCellWithReuseIdentifier: "LiveCell")
        return collectionview
    }()
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
        fetchLiveAstrologersData()
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
        return liveAstrologerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveCell", for: indexPath) as! LiveCell
        cell.layer.shadowColor = UIColor.systemGray3.cgColor
        cell.backgroundColor = .white
        cell.layer.shadowOpacity = 10
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 6
        cell.layer.cornerRadius = 10
        let data = liveAstrologerArray[indexPath.item]
        cell.configure(model: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == liveAstrologerArray.count - 1 {
            fetchLiveAstrologersData()
        }
    }
    
    func fetchLiveAstrologersData() {
        firestoreService.fetchDataForLiveAstrologers { model, error in
            if let error = error {
                print("\(error.localizedDescription)")
            }
            self.liveAstrologerArray.append(contentsOf: model)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
