//
//  SideBarCell.swift
//  Astrotalk
//
//  Created by Mac on 24/04/2024.
//

import UIKit

//MARK: -
class SideBarCell: UICollectionViewCell {
    
    //MARK: - UI -
    let userIconCell = ImageView(image: UIImage(systemName: ""))
    let userLabelCell = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .regular))
    let homeIconCell = ImageView(image: UIImage(systemName: ""))
    let homeLabelCell =  Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .black))
    let poojaIconCell = ImageView(image: UIImage(systemName: ""))
    let poojaLabelCell =  Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .black))
    let orderIconCell = ImageView(image: UIImage(systemName: ""))
    let orderLabelCell =  Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .black))
    let shopIconCell = ImageView(image: UIImage(systemName: ""))
    let shopLabelCell =  Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .black))
    let blogIconCell = ImageView(image: UIImage(systemName: ""))
    let blogLabelCell =  Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .black))
    let chatIconCell = ImageView(image: UIImage(systemName: ""))
    let chatLabelCell =  Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .black))
    let settingsIconCell = ImageView(image: UIImage(systemName: ""))
    let settingsLabelCell = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .black))
    let loginIconCell = ImageView(image: UIImage(systemName: ""))
    let loginLabelCell =  Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .black))
    
    ///StackViews - To stack the objects UI
    fileprivate lazy var userStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userIconCell, userLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    fileprivate lazy var homeStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [homeIconCell, homeLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    fileprivate lazy var poojaStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [poojaIconCell, poojaLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    fileprivate lazy var orderStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [orderIconCell, orderLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.alignment = .fill
        return stack
    }()
    
    fileprivate lazy var shopStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [shopIconCell, shopLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.alignment = .fill
        return stack
    }()
    
    fileprivate lazy var blogStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [blogIconCell, blogLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.alignment = .fill
        return stack
    }()
    
    fileprivate lazy var chatStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [chatIconCell, chatLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.alignment = .fill
        return stack
    }()
    
    fileprivate lazy var settingsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [settingsIconCell, settingsLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.alignment = .fill
        return stack
    }()
    
    fileprivate lazy var loginStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginIconCell, loginLabelCell])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.alignment = .fill
        return stack
    }()
    
    fileprivate lazy var parentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userStackView, homeStackView, poojaStackView, orderStackView, shopStackView, blogStackView, chatStackView, settingsStackView, loginStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = -20
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        addSubview(parentStackView)
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: -20),
            parentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            userIconCell.widthAnchor.constraint(equalToConstant: 50),
            userIconCell.heightAnchor.constraint(equalToConstant: 50),
            homeIconCell.widthAnchor.constraint(equalToConstant: 20),
            homeIconCell.heightAnchor.constraint(equalToConstant: 20),
            poojaIconCell.heightAnchor.constraint(equalToConstant: 20),
            poojaIconCell.widthAnchor.constraint(equalToConstant: 20),
            orderIconCell.heightAnchor.constraint(equalToConstant: 20),
            orderIconCell.widthAnchor.constraint(equalToConstant: 20),
            shopIconCell.heightAnchor.constraint(equalToConstant: 20),
            shopIconCell.widthAnchor.constraint(equalToConstant: 20),
            blogIconCell.heightAnchor.constraint(equalToConstant: 20),
            blogIconCell.widthAnchor.constraint(equalToConstant: 20),
            chatIconCell.heightAnchor.constraint(equalToConstant: 20),
            chatIconCell.widthAnchor.constraint(equalToConstant: 20),
            settingsIconCell.widthAnchor.constraint(equalToConstant: 20),
            settingsLabelCell.heightAnchor.constraint(equalToConstant: 20),
            loginIconCell.widthAnchor.constraint(equalToConstant: 20),
            loginIconCell.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    //MARK: - Configure Cell and Model Data
    func configure(data: SideBarItem) {
        switch data.type {
        case .user(let user):
            userIconCell.image = user.icon
            userLabelCell.text = user.label
            userLabelCell.numberOfLines = 5
        case .home(let home):
            homeIconCell.image = home.icon
            homeLabelCell.text = home.label
        case .pooja(let pooja):
            poojaIconCell.image = pooja.icon
            poojaLabelCell.text = pooja.label
        case .order(let order):
            orderIconCell.image = order.icon
            orderLabelCell.text = order.label
        case .shop(let shop):
            shopIconCell.image = shop.icon
            shopLabelCell.text = shop.label
        case .blog(let blog):
            blogIconCell.image = blog.icon
            blogLabelCell.text = blog.label
        case .chat(let chat):
            chatIconCell.image =  chat.icon
            chatLabelCell.text =  chat.label
        case .settings(let settings):
            settingsIconCell.image = settings.icon
            settingsLabelCell.text = settings.label
        case .login(let login):
            loginIconCell.image = login.icon
            loginLabelCell.text = login.label
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
