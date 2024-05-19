//
//  CustomCallCollectionView.swift
//  Astrotalk
//
//  Created by Mac on 19/05/2024.
//

import UIKit

//MARK: - Reusable object -
class CustomCallCollectionView: UICollectionView,  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    //MARK: - Object initialization -
    var astrologerDelegate: ViewProfileAstrologersDelegate?
    let firestoreService = FirestoreService.shared
    var callModel: [CallModel] = []
    private let reuseIdentifier = "CustomCallCell"
    let layout = UICollectionViewFlowLayout()
    
    init(frame: CGRect){
        super.init(frame: frame, collectionViewLayout: layout)
        customizeCollectionView()
        fetchCallData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Customizing -
    func customizeCollectionView() {
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        self.collectionViewLayout = layout
        self.delegate = self
        self.dataSource = self
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemGray5
        self.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        self.showsVerticalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(CustomCallCell.self, forCellWithReuseIdentifier: "CustomCallCell")
    }
    
    func setupLayout(with layout: UICollectionViewLayout) {
        self.collectionViewLayout = layout
    }
    
    // MARK: - UICollectionViewDataSource -
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return callModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCallCell", for: indexPath) as! CustomCallCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        let data = callModel[indexPath.item]
        cell.configure(model: data)
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    //MARK: - DelegateFlowLayout -
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == callModel.count - 1 {
            fetchCallData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.astrologerDelegate?.viewProfileAstrologersButtonCellTap(at: indexPath.item)
    }
    
    //MARK: - Fetches Dictionary Data from Firestore -
    func fetchCallData() {
        firestoreService.fetchDataForCall { callModels, error in
            if let error = error {
                print("Error fetching astrologers: \(error.localizedDescription)")
                return
            }
            self.callModel.append(contentsOf: callModels)
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
}
