//
//  ReusableCollectionVC.swift
//  Astrotalk
//
//  Created by Mac on 19/04/2024.
//

import UIKit

//MARK: - Reusable object -
class CustomCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Object initialization -
    let firestoreService = FirestoreService.shared
    var astrologerModel: [AstrologersModel] = []
    private let reuseIdentifier = "CustomCell"
    let layout = UICollectionViewFlowLayout()
    let footerHeight: CGFloat = 250
    
    init(frame: CGRect){
        super.init(frame: frame, collectionViewLayout: layout)
        customizeCollectionView()
        fetchAstrologersData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Customizing -
    func customizeCollectionView() {
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.collectionViewLayout = layout
        self.delegate = self
        self.dataSource = self
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: footerHeight, right: 0)
        self.showsVerticalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
    }
    
    func setupLayout(with layout: UICollectionViewLayout) {
        self.collectionViewLayout = layout
    }
    
    // MARK: - UICollectionViewDataSource -
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return astrologerModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.layer.shadowColor = UIColor.systemGray3.cgColor
        cell.backgroundColor = .white
        cell.layer.shadowOpacity = 10
        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.layer.shadowRadius = 6
        cell.layer.cornerRadius = 10
        let data = astrologerModel[indexPath.item]
        cell.configure(model: data)
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    //MARK: - DelegateFlowLayout -
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == astrologerModel.count - 1 {
            fetchAstrologersData()
        }
    }
    
    //MARK: - Fetches Dictionary Data from Firestore -
    func fetchAstrologersData() {
        firestoreService.fetchDataForAstrologers { astrologerModels, error in
            if let error = error {
                print("Error fetching astrologers: \(error.localizedDescription)")
                return
            }
            self.astrologerModel.append(contentsOf: astrologerModels)
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
}
