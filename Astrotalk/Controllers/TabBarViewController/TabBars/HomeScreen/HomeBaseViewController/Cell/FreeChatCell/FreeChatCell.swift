////
////  FreeChatCell.swift
////  Astrotalk
////
////  Created by Mac on 29/04/2024.
////
//
import UIKit
import Kingfisher

//MARK: - Cell -
class FreeChatCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UI -
    let firestoreService = FirestoreService.shared
    var freeChatArray: [FreeChatModel] = []
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(ChatCell.self, forCellWithReuseIdentifier: "ChatCell")
        return collectionview
    }()
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
        fetchFreeChatData()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    //MARK: - DataSource, DelegateFlowLayout -
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return freeChatArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCell", for: indexPath) as! ChatCell
        cell.backgroundColor = .systemYellow
        cell.layer.cornerRadius = 10
        if indexPath.item < freeChatArray.count {
            let item = freeChatArray[indexPath.item]
            cell.configure(model: item)
        } else {
            print("Index out of bounds for freeChatArray")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
    
    func fetchFreeChatData() {
        firestoreService.fetchDataForFreeChat { model, error  in
            if let error = error {
                print("\(error.localizedDescription)")
            }
            self.freeChatArray = model
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
