//
//  SearchBarHeader.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
// MARK: - Reusableview for the section headers
class SearchBarHeader: UICollectionReusableView, UISearchBarDelegate {
    
    //MARK: - Objects initialization
    static let identifier = "SearchBarHeader"
    var delegate: SearchBarDelegate?
    
    fileprivate lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Search astrologer, astromall products"
        search.delegate = self
        search.searchBarStyle = .minimal
        search.backgroundImage = UIImage()
        let searchTxtField = search.value(forKey: "searchField") as? UITextField
        searchTxtField?.backgroundColor = .white
        search.layer.shadowColor = UIColor.gray.cgColor
        search.layer.shadowOpacity = 10
        search.layer.shadowOffset = CGSize(width: 5, height: 5)
        search.layer.shadowRadius = 6
        search.layer.masksToBounds = false
        return search
    }()
    
    
    public func configure() {
        addSubview(searchBar)
    }
    
    //MARK: - Lifecycle -
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSectionHeaders()
    }
    
    // MARK: - Subviews and Layout -
    func setupSectionHeaders() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    //MARK: Protocol Delegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar.tintColor == .lightGray {
            searchBar.text = nil
            searchBar.tintColor = .black
        }
    }
    
    //MARK: - Tap gesture action to show a Search Viewcontroller -
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDelegateAction))
        searchBar.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Delegate protocol to toggle a Search Viewcontroller -
    @objc func tapGestureDelegateAction() {
        delegate?.searchBarDidTap()
    }
}


