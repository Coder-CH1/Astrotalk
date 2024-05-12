//
//  DailyHoroscopeCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit

//MARK: - Cell -
class DailyHoroscopeCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    //MARK: - UI -
    let firestoreService = FirestoreService.shared
    var delegate: CellSelectedDelegate?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 2
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.contentInset = UIEdgeInsets(top: 15, left: 5, bottom: 30, right: 0)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.clipsToBounds = true
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(CircleCell.self, forCellWithReuseIdentifier: "CircleCell")
        return collectionview
    }()
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    //MARK: - DataSource, DelegateFlowLayout -
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horoscopeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CircleCell", for: indexPath) as! CircleCell
        cell.backgroundColor = .systemYellow
        cell.layer.cornerRadius = 35
        let item = horoscopeArray[indexPath.item]
        cell.configure(model: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/4.7, height: 70)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        DispatchQueue.main.async {
//            let webVC = WebViewController()
//            webVC.url = URL(string: "https://astrotalk.com/horoscope/todays-horoscope")
//            self.delegate?.cellSelected(webVC)
//        }
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = URL(string: "https://astrotalk.com/horoscope/todays-horoscope") else {
                print("Invalid URL.")
                return
            }

            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    print("Failed to load data.")
                    return
                }
                
                DispatchQueue.main.async {
                    let webVC = WebViewController()
                    webVC.title = String(data: data, encoding: .utf8)
                    self.delegate?.cellSelected(webVC)
                }
            }
            task.resume()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
